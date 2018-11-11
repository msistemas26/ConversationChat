//
//  ListChatRoomsModels.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 14/10/18.
//  Copyright (c) 2018 Raul Mantilla. All rights reserved.

import UIKit

enum ListChatRooms
{
    // MARK: Use cases
    
    enum FetchChatRooms
    {
        struct Request
        {
        }
        struct Response
        {
            var chatRooms: [ChatRoom]
        }
        struct ViewModel
        {
            struct DisplayedChatRoom
            {
                var id: Int = 0
                var name: String = ""
                var room_description: String = ""
                var timestamp:Date = Date()
                var unreadMesagesCount: Int = 0
                var logoUrl: String = ""
                var isPrivate: Bool = false
                var password: String = ""
            }
            var displayedChatRooms: [DisplayedChatRoom]
        }
    }
}
