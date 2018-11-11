//
//  RealmMessage.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 14/10/18.
//  Copyright © 2018 Raul Mantilla. All rights reserved.
//

import Foundation
import RealmSwift

class RealmMessage: Object
{
    @objc dynamic var id: Int = 0
    @objc dynamic var from: RealmContact!
    @objc dynamic var timestamp: Date = Date()
    @objc dynamic var message: String = ""
    @objc dynamic var isReaded: Bool = false
    
    let chatRoom = LinkingObjects(fromType: RealmChatRoom.self, property: "messages")
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
