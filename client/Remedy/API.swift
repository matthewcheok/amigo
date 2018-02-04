//  This file was automatically generated and should not be edited.

import Apollo

public final class GetUsersQuery: GraphQLQuery {
  public static let operationString =
    "query GetUsers {\n  users {\n    __typename\n    id\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("users", type: .nonNull(.list(.nonNull(.object(User.selections))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(users: [User]) {
      self.init(snapshot: ["__typename": "Query", "users": users.map { $0.snapshot }])
    }

    public var users: [User] {
      get {
        return (snapshot["users"] as! [Snapshot]).map { User(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "users")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID) {
        self.init(snapshot: ["__typename": "User", "id": id])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class GetUserQuery: GraphQLQuery {
  public static let operationString =
    "query GetUser($id: ID!) {\n  user(id: $id) {\n    __typename\n    id\n    chat {\n      __typename\n      id\n    }\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("user", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(User.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(user: User) {
      self.init(snapshot: ["__typename": "Query", "user": user.snapshot])
    }

    public var user: User {
      get {
        return User(snapshot: snapshot["user"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("chat", type: .object(Chat.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, chat: Chat? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "chat": chat.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var chat: Chat? {
        get {
          return (snapshot["chat"] as? Snapshot).flatMap { Chat(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "chat")
        }
      }

      public struct Chat: GraphQLSelectionSet {
        public static let possibleTypes = ["Chat"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID) {
          self.init(snapshot: ["__typename": "Chat", "id": id])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

public final class GetChatQuery: GraphQLQuery {
  public static let operationString =
    "query GetChat($id: ID!) {\n  chat(id: $id) {\n    __typename\n    id\n    participants {\n      __typename\n      id\n    }\n    messages {\n      __typename\n      id\n      text\n      prompt\n      createdAt\n      updatedAt\n      sender {\n        __typename\n        id\n      }\n    }\n    createdAt\n    updatedAt\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("chat", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(Chat.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(chat: Chat) {
      self.init(snapshot: ["__typename": "Query", "chat": chat.snapshot])
    }

    public var chat: Chat {
      get {
        return Chat(snapshot: snapshot["chat"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "chat")
      }
    }

    public struct Chat: GraphQLSelectionSet {
      public static let possibleTypes = ["Chat"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("participants", type: .list(.nonNull(.object(Participant.selections)))),
        GraphQLField("messages", type: .list(.nonNull(.object(Message.selections)))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, participants: [Participant]? = nil, messages: [Message]? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Chat", "id": id, "participants": participants.flatMap { $0.map { $0.snapshot } }, "messages": messages.flatMap { $0.map { $0.snapshot } }, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var participants: [Participant]? {
        get {
          return (snapshot["participants"] as? [Snapshot]).flatMap { $0.map { Participant(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "participants")
        }
      }

      public var messages: [Message]? {
        get {
          return (snapshot["messages"] as? [Snapshot]).flatMap { $0.map { Message(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.snapshot } }, forKey: "messages")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public struct Participant: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID) {
          self.init(snapshot: ["__typename": "User", "id": id])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("text", type: .scalar(String.self)),
          GraphQLField("prompt", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("sender", type: .nonNull(.object(Sender.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, text: String? = nil, prompt: String? = nil, createdAt: String, updatedAt: String, sender: Sender) {
          self.init(snapshot: ["__typename": "Message", "id": id, "text": text, "prompt": prompt, "createdAt": createdAt, "updatedAt": updatedAt, "sender": sender.snapshot])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var text: String? {
          get {
            return snapshot["text"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "text")
          }
        }

        public var prompt: String? {
          get {
            return snapshot["prompt"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "prompt")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var sender: Sender {
          get {
            return Sender(snapshot: snapshot["sender"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "sender")
          }
        }

        public struct Sender: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID) {
            self.init(snapshot: ["__typename": "User", "id": id])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }
        }
      }
    }
  }
}

public final class CreateNewUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateNewUser {\n  createNewUser(deviceToken: \"hey\") {\n    __typename\n    id\n    deviceToken\n    chat {\n      __typename\n      id\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createNewUser", arguments: ["deviceToken": "hey"], type: .object(CreateNewUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createNewUser: CreateNewUser? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createNewUser": createNewUser.flatMap { $0.snapshot }])
    }

    public var createNewUser: CreateNewUser? {
      get {
        return (snapshot["createNewUser"] as? Snapshot).flatMap { CreateNewUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createNewUser")
      }
    }

    public struct CreateNewUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("deviceToken", type: .scalar(String.self)),
        GraphQLField("chat", type: .object(Chat.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, deviceToken: String? = nil, chat: Chat? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "deviceToken": deviceToken, "chat": chat.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var deviceToken: String? {
        get {
          return snapshot["deviceToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "deviceToken")
        }
      }

      public var chat: Chat? {
        get {
          return (snapshot["chat"] as? Snapshot).flatMap { Chat(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "chat")
        }
      }

      public struct Chat: GraphQLSelectionSet {
        public static let possibleTypes = ["Chat"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID) {
          self.init(snapshot: ["__typename": "Chat", "id": id])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

public final class CreateNewMessageMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateNewMessage($senderID: ID!, $chatID: ID!, $text: String!) {\n  createNewMessage(senderID: $senderID, chatID: $chatID, text: $text) {\n    __typename\n    id\n    text\n    prompt\n    createdAt\n    updatedAt\n    sender {\n      __typename\n      id\n    }\n  }\n}"

  public var senderID: GraphQLID
  public var chatID: GraphQLID
  public var text: String

  public init(senderID: GraphQLID, chatID: GraphQLID, text: String) {
    self.senderID = senderID
    self.chatID = chatID
    self.text = text
  }

  public var variables: GraphQLMap? {
    return ["senderID": senderID, "chatID": chatID, "text": text]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createNewMessage", arguments: ["senderID": GraphQLVariable("senderID"), "chatID": GraphQLVariable("chatID"), "text": GraphQLVariable("text")], type: .object(CreateNewMessage.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createNewMessage: CreateNewMessage? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createNewMessage": createNewMessage.flatMap { $0.snapshot }])
    }

    public var createNewMessage: CreateNewMessage? {
      get {
        return (snapshot["createNewMessage"] as? Snapshot).flatMap { CreateNewMessage(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createNewMessage")
      }
    }

    public struct CreateNewMessage: GraphQLSelectionSet {
      public static let possibleTypes = ["Message"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("text", type: .scalar(String.self)),
        GraphQLField("prompt", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("sender", type: .nonNull(.object(Sender.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, text: String? = nil, prompt: String? = nil, createdAt: String, updatedAt: String, sender: Sender) {
        self.init(snapshot: ["__typename": "Message", "id": id, "text": text, "prompt": prompt, "createdAt": createdAt, "updatedAt": updatedAt, "sender": sender.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var text: String? {
        get {
          return snapshot["text"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "text")
        }
      }

      public var prompt: String? {
        get {
          return snapshot["prompt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "prompt")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var sender: Sender {
        get {
          return Sender(snapshot: snapshot["sender"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "sender")
        }
      }

      public struct Sender: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID) {
          self.init(snapshot: ["__typename": "User", "id": id])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}