//
//  ListContactsModels.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 20/10/18.
//  Copyright (c) 2018 Raul Mantilla. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

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
            var contacts: [RealmContact]
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
                var description: String
            }
            var displayedContacts: [DisplayedContact]
        }
    }
}
