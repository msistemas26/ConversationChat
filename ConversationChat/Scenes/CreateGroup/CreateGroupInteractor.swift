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
  func fetchContacts()
}

protocol CreateGroupDataStore
{
  var contacts: [Contact] { get set }
}

class CreateGroupInteractor: CreateGroupBusinessLogic, CreateGroupDataStore
{
  var presenter: CreateGroupPresentationLogic?
  var worker: CreateGroupWorker?
  var contacts: [Contact] = []
  
  // MARK: Do something
  
  func fetchContacts()
  {
    worker = CreateGroupWorker()
    
    worker?.fetchContacts{ (contacts) in
        self.contacts = contacts
        let response = CreateGroup.FetchContacts.Response(contacts: contacts)
        self.presenter?.presentContacts(response: response)
    }
  }
}
