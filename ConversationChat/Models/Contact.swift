//
//  Contact.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 11/11/18.
//  Copyright © 2018 Raul Mantilla. All rights reserved.
//

import Foundation

struct Contact: Encodable, Decodable
{
    var id: Int = 0
    var name: String = ""
    var lastname: String = ""
    var phoneNumber: String = ""
    var avatarUrl: String = ""
}

extension Contact {

    init (withRealmContact contact: RealmContact) {
        self.id = contact.id
        self.name = contact.name
        self.lastname = contact.lastname
        self.phoneNumber = contact.phoneNumber
        self.avatarUrl = contact.avatarUrl
    }
    
    func realmContact() -> RealmContact {
        let contact = RealmContact()
        contact.id = self.id
        contact.name = self.name
        contact.lastname = self.lastname
        contact.phoneNumber = self.phoneNumber
        contact.avatarUrl = self.avatarUrl
        return contact
    }
    
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
