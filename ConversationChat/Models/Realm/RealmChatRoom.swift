//
//  RealmChatRoom.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 14/10/18.
//  Copyright © 2018 Raul Mantilla. All rights reserved.
//

import Foundation
import RealmSwift

class RealmChatRooms: Object
{
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var room_description: String = ""
    @objc dynamic var timestamp:Date = Date()
    @objc dynamic var unreadMesagesCount: Int = 0
    @objc dynamic var logoUrl: String = ""
    @objc dynamic var isPrivate: Bool = false
    @objc dynamic var password: Bool = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
