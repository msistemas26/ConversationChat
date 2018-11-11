//
//  ConversationRoomModels.swift
//  ConversationChat
//
//  Created by Raul Humberto Mantilla Assia on 10/23/18.
//  Copyright (c) 2018 Raul Mantilla. All rights reserved.

import Foundation

enum ConversationRoom
{
    // MARK: Use cases
    
    struct DisplayedMessage
    {
        var id: Int
        var from: Contact
        var timestamp: String
        var message: String
        var isReaded: Bool
    }
    
    enum FetchMessages
    {
        struct Request
        {
            var chatRoom: ChatRoom
        }
        struct Response
        {
            var messages: [Message]
        }
        struct ViewModel
        {
            var displayedMessages: [DisplayedMessage]
        }
    }
    
    enum SendMessage
    {
        struct Request
        {
            struct Message
            {
                var chat_room: Int
                var from: Int
                var to: Int
                var message: String
            }
            var message: Message
        }
        struct Response
        {
            var message: Message
        }
        struct ViewModel
        {
            var displayedMessage: DisplayedMessage
        }
    }
}
