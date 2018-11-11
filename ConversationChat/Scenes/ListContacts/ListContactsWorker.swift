//
//  ListContactsWorker.swift
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
import RealmSwift

class ListContactsWorker
{
    func fetchContacts(completionHandler completion: @escaping ([Contact]) -> Void)
    {
        let realm = try! Realm()
        var contacts: [Contact] = []
        
        let realmContacts = realm.objects(RealmContact.self)
        for realmContact in realmContacts {
            contacts.append(Contact(withRealmContact: realmContact))
        }
        completion(contacts)
    }
    
    func createChatRoom(withContacts contacts: [Contact], completionHandler completion: @escaping (ChatRoom) -> Void)
    {
        let worker = ChatWorker()
        worker.createChatRoom(withContacts: contacts) { (chatRoom) in
            completion(chatRoom)
        }
    }
}
