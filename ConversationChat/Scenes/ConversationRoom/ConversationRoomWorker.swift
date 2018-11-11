//
//  ConversationRoomWorker.swift
//  ConversationChat
//
//  Created by Raul Humberto Mantilla Assia on 10/23/18.
//  Copyright (c) 2018 Raul Mantilla. All rights reserved.


import Foundation
import RealmSwift

class ConversationRoomWorker
{
    func fetchMessages(withChatRoom chatRoom: ChatRoom, completionHandler completion: @escaping ([Message]) -> Void)
    {
        var messsages: [Message] = []
        
        let realm = try! Realm()
        if let realmChatRoom = realm.object(ofType: RealmChatRoom.self, forPrimaryKey: chatRoom.id) {
            let realmMessages = realmChatRoom.messages
            for realmMessage in realmMessages {
                messsages.append(Message(withRealmMessage:realmMessage))
            }
            completion(messsages)
        }
    }
    
    func sendMessage(withChatRoom chatRoom: ChatRoom, message: ConversationRoom.SendMessage.Request.Message, completionHandler completion: @escaping ((message: Message, status: Bool)) -> Void)
    {
        let realm = try! Realm()
        if let realmChatRoom = realm.object(ofType: RealmChatRoom.self, forPrimaryKey: chatRoom.id),
            let currentUser = UserDefaultsConstant.CurrentUser.getValue() as? Contact,
            let realmContact = realm.object(ofType: RealmContact.self, forPrimaryKey: currentUser.id) {
            let realmMessage = RealmMessage()
            realmMessage.id = UUID().hashValue
            realmMessage.from = realmContact
            realmMessage.timestamp = Date()
            realmMessage.message = message.message
            realmMessage.isReaded = false
            try! realm.write {
                realmChatRoom.messages.append(realmMessage)
            }
            completion((message: Message(withRealmMessage: realmMessage), status:true))
        }
    }
}
