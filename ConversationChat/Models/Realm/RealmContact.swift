//
//  RealmContact.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 14/10/18.
//  Copyright © 2018 Raul Mantilla. All rights reserved.
//

import Foundation
import RealmSwift

class RealmContact: Object
{
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var lastname: String = ""
    @objc dynamic var phoneNumber: String = ""
    @objc dynamic var avatarUrl: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
