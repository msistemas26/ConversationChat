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
    
    enum FetchMessages
    {
        struct Request
        {
        }
        struct Response
        {
            var messages: [RealmChatRoomConversation]
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
                var chat_room_id: Int
                var from_id: Int
                var to_id: Int
                var message: String
            }
            var message: Message
        }
        struct Response
        {
            var message: RealmChatRoomConversation
        }
        struct ViewModel
        {
            var displayedMessage: DisplayedMessage
        }
    }
    
    struct DisplayedMessage
    {
        var id: Int
        var chat_room_id: Int
        var from_id: Int
        var to_id: Int
        var timestamp: String
        var message: String
        var isReaded: Bool
    }
}
