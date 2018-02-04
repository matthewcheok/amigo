const { GraphQLServer } = require('graphql-yoga')
const { Prisma } = require('prisma-binding')
const activityPrompts = [
  "Go for a 10 min walk outside. Just enjoy the weather and observe things around you.",
  "Ask your buddy how they are doing today. Share how you are feeling now with them.",
  "Breathe deeply for 30 seconds. In through your nose, out through your mouth.",
];

const resolvers = {
  Query: {
    users(parent, args, ctx, info) {
      return ctx.db.query.users({}, info)
    },
    chat(parent, {id}, ctx, info) {
      return ctx.db.query.chat({where: {id}}, info)
    },
    user(parent, {id}, ctx, info) {
      return ctx.db.query.user({where: {id}}, info)
    },
  },
  Mutation: {
    async createNewUser(parent, { deviceToken }, ctx, info) {
      // try to find another user waiting to have a chat
      // perform a query to get other user without chat
      const existingUsers = await ctx.db.query.users({ where: { chat: null } });
      let newUser = await ctx.db.mutation.createUser(
        {
          data: {
            deviceToken,
          },
        },
        info,
      );
      if (existingUsers.length > 0) {
        let existingUserId = existingUsers[0].id;
        const chat = await ctx.db.mutation.createChat(
          {
            data: {
            participants: {
              connect: [
                {id: existingUserId},
                {id: newUser.id},
              ]
            }
          }
        }, info);

        newUser = await ctx.db.query.user({where: {id: newUser.id}}, info);
      }
      return newUser;
    },
    async createNewMessage(parent, { senderID, chatID, text }, ctx, info) {
      return await ctx.db.mutation.createMessage(
          {
            data: {
            sender: {
              connect: {id: senderID},
            },
            chat: {
              connect: {id: chatID},
            },
            text,
          }
        },
        info,
      );
    },
    async createActivity(parent, { senderID, chatID }, ctx, info) {
      // Need senderID to create message. Ignore on client for now.
      $prompt_id = random(0, activityPrompts.length);
      return await ctx.db.mutation.createMessage(
          {
            data: {
            sender: {
              connect: {id: senderID},
            },
            chat: {
              connect: {id: chatID},
            },
            prompt: activityPrompts[$prompt_id],
          }
        },
        info,
      );
    }
  },
  Subscription: {
    user: {
      subscribe: async (parent, {id}, ctx, info) => {
        return ctx.db.subscription.user({where: {node:{id}}}, info)
      },
    },
    chat: {
      subscribe: async(parent, {id}, ctx, info) => {
        return ctx.db.subscription.chat({where: {node:{id}}}, info)
      },
    }
  }
}

const server = new GraphQLServer({
  typeDefs: './src/schema.graphql',
  resolvers,
  context: req => ({
    ...req,
    db: new Prisma({
      typeDefs: 'src/generated/prisma.graphql',
      endpoint: 'https://us1.prisma.sh/public-steelelk-354/mentalbuddy-server/dev', // the endpoint of the Prisma DB service
      secret: 'mysecret123', // specified in database/prisma.yml
      debug: true, // log all GraphQL queryies & mutations
    }),
  }),
})

server.start(() => console.log('Server is running on http://localhost:4000'))
