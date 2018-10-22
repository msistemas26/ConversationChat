//
//  RealmChatRoomConversation.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 14/10/18.
//  Copyright © 2018 Raul Mantilla. All rights reserved.
//

import Foundation
import RealmSwift

class RealmChatRoomConversation: Object
{
    @objc dynamic var id: Int = 0
    @objc dynamic var chat_room_id: Int = 0
    @objc dynamic var from_id: Int = 0
    @objc dynamic var to_id: Int = 0
    @objc dynamic var timestamp: Date = Date()
    @objc dynamic var message: String = ""
    @objc dynamic var isReaded: Bool = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
