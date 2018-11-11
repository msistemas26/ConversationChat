//
//  Message.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 11/11/18.
//  Copyright © 2018 Raul Mantilla. All rights reserved.
//

import Foundation

struct Message
{
    var id: Int = 0
    var from: Contact!
    var timestamp: Date = Date()
    var message: String = ""
    var isReaded: Bool = false
}

extension Message {
    
    init (withRealmMessage message: RealmMessage) {
        self.id = message.id
        self.from = Contact(withRealmContact: message.from)
        self.timestamp = message.timestamp
        self.message = message.message
        self.isReaded = message.isReaded
    }
    
    func realmMessage() -> RealmMessage {
        let message = RealmMessage()
        message.id = self.id
        message.from = self.from.realmContact()
        message.timestamp = self.timestamp
        message.message = self.message
        message.isReaded = self.isReaded
        return message
    }
}

