//
//  ChatRoom.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 11/11/18.
//  Copyright © 2018 Raul Mantilla. All rights reserved.
//

import Foundation

struct ChatRoom
{
    var id: Int = 0
    var name: String = ""
    var room_description: String?
    var timestamp:Date = Date()
    var unreadMesagesCount: Int = 0
    var logoUrl: String = ""
    var isPrivate: Bool = false
    var password: String = ""
}

extension ChatRoom {
    init (withRealmChatRoom chatRoom: RealmChatRoom) {
        self.id = chatRoom.id
        self.name = chatRoom.name
        self.unreadMesagesCount = chatRoom.unreadMesagesCount
        self.logoUrl = chatRoom.logoUrl
        self.isPrivate = chatRoom.isPrivate
        self.password = chatRoom.password
        if let lastMessage = chatRoom.messages.last {
            self.room_description = lastMessage.message
            self.timestamp = lastMessage.timestamp
        } else {
            self.room_description = nil
            self.timestamp = chatRoom.timestamp
        }
    }
    
    func realmChatRoom() -> RealmChatRoom {
        let chatRoom = RealmChatRoom()
        chatRoom.id = self.id
        chatRoom.name = self.name
        chatRoom.room_description = self.room_description
        chatRoom.timestamp = self.timestamp
        chatRoom.unreadMesagesCount = self.unreadMesagesCount
        chatRoom.logoUrl = self.logoUrl
        chatRoom.isPrivate = self.isPrivate
        chatRoom.password = self.password
        return chatRoom
    }
}
