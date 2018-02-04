//
//  DataManager.swift
//  Remedy
//
//  Created by Matthew Cheok on 2/4/18.
//  Copyright © 2018 Matthew Cheok. All rights reserved.
//

import Foundation
import Apollo


class DataManager {
  static let shared = DataManager()
  
  var userId: GraphQLID?
  var chatId: GraphQLID?
  
  let apollo = ApolloClient(url: URL(string: "https://mentalbuddy-server-hpltlgcbfq.now.sh")!)
  
  func createUser(completion: @escaping (String, String?) -> Void) {
    apollo.perform(mutation: CreateNewUserMutation(), queue: DispatchQueue.main) { (result, error) in
      guard let userId = result?.data?.createNewUser?.id else {
        return
      }
      self.userId = userId
      self.chatId = result?.data?.createNewUser?.chat?.id
      completion(userId, self.chatId)
    }
  }
  
  func createMessage(text: String, completion: @escaping (Content) -> Void) {
    guard let senderId = userId else {
      return
    }
    
    guard let chatId = chatId else {
      return
    }
    
    apollo.perform(mutation: CreateNewMessageMutation(senderID: senderId, chatID: chatId, text: text), queue: DispatchQueue.main) { (result, error) in
      guard let message = result?.data?.createNewMessage else {
        return
      }
      let content = Content.Message(isSender: message.sender.id == senderId, text: message.text ?? "")
      completion(content)
    }
  }
  
  func getChat(completion: @escaping (String?) -> Void) {
    guard let userId = userId else {
      return
    }
    
    apollo.fetch(query: GetUserQuery(id: userId), cachePolicy: .fetchIgnoringCacheData, queue: DispatchQueue.main) { (result, error) in
      guard let id = result?.data?.user.chat?.id else {
        return
      }
      self.chatId = id
      completion(self.chatId)
    }
  }
  
  func getMessages(completion: @escaping ([Content]) -> Void) {
    guard let senderId = userId else {
      return
    }
    
    guard let chatId = chatId else {
      return
    }

    apollo.fetch(query: GetChatQuery(id: chatId), cachePolicy: .fetchIgnoringCacheData, queue: DispatchQueue.main) { (result, error) in
      var content = [Content]()
      guard let messages = result?.data?.chat.messages else {
        return
      }
      
      for message in messages {
        if let text = message.text {
          content.append(.Message(isSender: message.sender.id
            == senderId, text: text))
        }
      }
      
      completion(content)
    }
  }
}
