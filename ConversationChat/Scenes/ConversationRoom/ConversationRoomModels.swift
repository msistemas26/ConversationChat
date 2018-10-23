//
//  ConversationRoomModels.swift
//  ConversationChat
//
//  Created by Raul Humberto Mantilla Assia on 10/23/18.
//  Copyright (c) 2018 Raul Mantilla. All rights reserved.


enum ListMessages
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
            var displayedMessages: [DisplayedMessage]
        }
    }
}
