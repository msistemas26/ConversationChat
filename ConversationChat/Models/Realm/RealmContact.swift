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

extension RealmContact {
    
    var fullname: String {
        let fullname =  name + " " + lastname
        return fullname.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    var initials: String {
        let nameComponents = fullname.split(separator: " ").map { return $0.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) }
        guard
            nameComponents.count > 1,
            let firstComponent = nameComponents.first,
            let lastComponent = nameComponents.last
            else {
                return String(name.uppercased().prefix(2))
        }
        return String(firstComponent.prefix(1) + lastComponent.prefix(1))
    }
}
