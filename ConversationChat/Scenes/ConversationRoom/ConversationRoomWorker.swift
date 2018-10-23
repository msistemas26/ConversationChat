//
//  ConversationRoomWorker.swift
//  ConversationChat
//
//  Created by Raul Humberto Mantilla Assia on 10/23/18.
//  Copyright (c) 2018 Raul Mantilla. All rights reserved.

import UIKit
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
}
