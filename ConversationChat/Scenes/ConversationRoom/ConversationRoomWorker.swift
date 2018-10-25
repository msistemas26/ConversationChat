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
    func fetchMessages(completionHandler completion: @escaping ([RealmChatRoomConversation]) -> Void)
    {
        let realm = try! Realm()
        var messsages: [RealmChatRoomConversation] = []
        
        let realmMessages = realm.objects(RealmChatRoomConversation.self)
        for realmMessage in realmMessages {
            messsages.append(realmMessage)
        }
        completion(messsages)
    }
    
    func sendMessage(message: ConversationRoom.SendMessage.Request.Message, completionHandler completion: @escaping ((message: RealmChatRoomConversation, status: Bool)) -> Void)
    {
        let message = message
        let realm = try! Realm()
        let realmMessage = RealmChatRoomConversation()
        realmMessage.id = UUID().hashValue
        realmMessage.chat_room_id = message.chat_room_id
        realmMessage.from_id = message.from_id
        realmMessage.to_id = message.to_id
        realmMessage.timestamp = Date()
        realmMessage.message = message.message
        realmMessage.isReaded = false
        
        try! realm.write {
            realm.add(realmMessage, update: true)
            completion((message: realmMessage, status:true))
        }
    }
}
