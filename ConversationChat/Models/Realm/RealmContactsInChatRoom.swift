//
//  RealmContactsInChatRoom.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 14/10/18.
//  Copyright © 2018 Raul Mantilla. All rights reserved.
//

import Foundation
import RealmSwift

class RealmContactsInChatRoom: Object
{
    @objc dynamic var id = 0
    @objc dynamic var chat_room_id: Int = 0
    @objc dynamic var contact_id: Int = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
