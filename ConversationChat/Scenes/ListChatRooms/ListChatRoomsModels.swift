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
            var chatRooms: [RealmChatRooms]
        }
        struct ViewModel
        {
            struct DisplayedChatRoom
            {
                var id: Int
                var name: String
                var description: String
                var timestamp: Date
                var unreadMesagesCount: Int
                var logoUrl: String
            }
            var displayedChatRooms: [DisplayedChatRoom]
        }
    }
}
