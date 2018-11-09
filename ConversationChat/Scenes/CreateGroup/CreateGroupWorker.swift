//
//  CreateGroupWorker.swift
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

class CreateGroupWorker
{
    func fetchContacts(completionHandler completion: @escaping ([RealmContact]) -> Void)
    {
        let realm = try! Realm()
        var contacts: [RealmContact] = []
        
        let realmContacts = realm.objects(RealmContact.self)
        for realmContact in realmContacts {
            contacts.append(realmContact)
        }
        completion(contacts)
    }
}
