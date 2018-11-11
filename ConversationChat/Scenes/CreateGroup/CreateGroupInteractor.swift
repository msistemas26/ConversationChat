//
//  CreateGroupInteractor.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 20/10/18.
//  Copyright (c) 2018 Raul Mantilla. All rights reserved.
//

import UIKit

protocol CreateGroupBusinessLogic
{
    var selectedContactsCount: Int { get }
    func fetchContacts()
    func manageSelectedContacts(withContact: CreateGroup.FetchContacts.ViewModel.DisplayedContact)
    func isContactSelected(withContact: CreateGroup.FetchContacts.ViewModel.DisplayedContact) -> Bool
    func createChatRoom()
}

protocol CreateGroupDataStore
{
    var contacts: [Contact] { get set }
    var selectedContacts: Set<CreateGroup.FetchContacts.ViewModel.DisplayedContact>! { get set }
    var createdChatRoom: ChatRoom? { get set }
}

class CreateGroupInteractor: CreateGroupBusinessLogic, CreateGroupDataStore
{
    var presenter: CreateGroupPresentationLogic?
    var worker: CreateGroupWorker?
    var contacts: [Contact] = []
    var selectedContacts: Set<CreateGroup.FetchContacts.ViewModel.DisplayedContact>! = []
    var createdChatRoom: ChatRoom?
    
    // MARK: Methods
    
    var selectedContactsCount: Int {
        return selectedContacts.count
    }
    
    func fetchContacts()
    {
        worker = CreateGroupWorker()
        
        worker?.fetchContacts{ (contacts) in
            self.contacts = contacts
            let response = CreateGroup.FetchContacts.Response(contacts: contacts)
            self.presenter?.presentContacts(response: response)
        }
    }
    
    func manageSelectedContacts(withContact contact: CreateGroup.FetchContacts.ViewModel.DisplayedContact) {
        if selectedContacts.contains(contact) {
            selectedContacts.remove(contact)
        } else {
            selectedContacts.insert(contact)
        }
    }
    
    func isContactSelected(withContact contact: CreateGroup.FetchContacts.ViewModel.DisplayedContact) -> Bool {
        return selectedContacts.contains(contact)
    }
    
    func createChatRoom()
    {
        worker = CreateGroupWorker()
        
        worker?.createChatRoom(withContacts: self.selectedContacts){ (chatRoom) in
            self.createdChatRoom = chatRoom
            let response = CreateGroup.CreateChatRoom.Response(chatRoom: chatRoom)
            self.presenter?.presentCreatedChatRoom(response: response)
        }
    }
}
