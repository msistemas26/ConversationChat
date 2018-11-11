//
//  ListContactsModels.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 20/10/18.
//  Copyright (c) 2018 Raul Mantilla. All rights reserved.
//

enum ListContacts
{
    // MARK: Use cases
    enum FetchContacts
    {
        struct Request
        {
        }
        struct Response
        {
            var contacts: [Contact]
        }
        struct ViewModel
        {
            struct DisplayedContact
            {
                var id: Int
                var name: String
                var lastname: String
                var fullname: String
                var initials: String
                var phoneNumber: String
                var avatarUrl: String
                var description: String?
            }
            var displayedContacts: [DisplayedContact]
        }
    }
    
    enum createChatRoom
    {
        struct Request
        {
            var selectedContact: Contact
        }
        struct Response
        {
            var chatRoom: ChatRoom
        }
    }
}


