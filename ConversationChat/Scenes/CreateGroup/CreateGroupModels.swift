//
//  CreateGroupModels.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 20/10/18.
//  Copyright (c) 2018 Raul Mantilla. All rights reserved.
//

enum CreateGroup
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
            struct DisplayedContact: Hashable
            {
                var id: Int
                var name: String
                var lastname: String
                var fullname: String
                var initials: String
                var phoneNumber: String
                var avatarUrl: String
                var description: String?
                var hashValue: Int = 0
            }
            var displayedContacts: [DisplayedContact]
        }
    }
}
