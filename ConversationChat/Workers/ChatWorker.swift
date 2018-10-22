//
//  ChatWorker.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 14/10/18.
//  Copyright © 2018 Raul Mantilla. All rights reserved.
//

import Foundation
import RealmSwift

class ChatWorker {
    func prepopulateData() {
        prepopulateContactsIntoRealm()
    }
    
    func prepopulateContactsIntoRealm() {
        
        let realm = try! Realm()
        let realmContacts = realm.objects(RealmContact.self)
        guard realmContacts.count == 0 else {
            return
        }
        
        let contacts = [["id":19,"name":"Robert","lastname":"Smith","phoneNumber":"193-997-4842","avatarUrl":"http://kbapi.herokuapp.com/images/10.png"],["id":92,"name":"Polly","lastname":"Davis","phoneNumber":"710-387-7956","avatarUrl":"http://kbapi.herokuapp.com/images/7.png"],["id":49,"name":"Richard","lastname":"Stevens","phoneNumber":"319-800-1221","avatarUrl":"http://kbapi.herokuapp.com/images/3.png"],["id":43,"name":"Eve","lastname":"Andrews","phoneNumber":"669-326-10994","avatarUrl":"http://kbapi.herokuapp.com/images/7.png"],["id":63,"name":"Karen","lastname":"Robinson","phoneNumber":"650-685-9539","avatarUrl":"http://kbapi.herokuapp.com/images/10.png"],["id":77,"name":"Richard","lastname":"Edwards","phoneNumber":"926-955-5915","avatarUrl":"http://kbapi.herokuapp.com/images/9.png"],["id":91,"name":"Matthew","lastname":"Harrison","phoneNumber":"491-781-8649","avatarUrl":"http://kbapi.herokuapp.com/images/4.png"],["id":51,"name":"Susan","lastname":"Peters","phoneNumber":"206-441-8082","avatarUrl":"http://kbapi.herokuapp.com/images/8.png"],["id":80,"name":"Diana","lastname":"Kirk","phoneNumber":"214-256-8833","avatarUrl":"http://kbapi.herokuapp.com/images/10.png"],["id":83,"name":"Kimberly","lastname":"Harris","phoneNumber":"990-403-4758","avatarUrl":"http://kbapi.herokuapp.com/images/2.png"],["id":38,"name":"Maria","lastname":"Grant","phoneNumber":"460-941-2788","avatarUrl":"http://kbapi.herokuapp.com/images/9.png"],["id":2,"name":"Helen","lastname":"Robinson","phoneNumber":"814-671-6121","avatarUrl":"http://kbapi.herokuapp.com/images/4.png"],["id":53,"name":"Joseph","lastname":"Kirby","phoneNumber":"325-398-5670","avatarUrl":"http://kbapi.herokuapp.com/images/7.png"],["id":28,"name":"Kimberly","lastname":"Lake","phoneNumber":"908-862-9335","avatarUrl":"http://kbapi.herokuapp.com/images/4.png"],["id":84,"name":"Philip","lastname":"Lewis","phoneNumber":"882-794-3049","avatarUrl":"http://kbapi.herokuapp.com/images/5.png"]]
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        try! realm.write {
            for contact in contacts {
                let realmContact = RealmContact()
                realmContact.id = contact["id"] as! Int
                realmContact.name = contact["name"] as! String
                realmContact.lastname = contact["lastname"] as! String
                realmContact.phoneNumber = contact["phoneNumber"] as! String
                realmContact.avatarUrl = contact["avatarUrl"] as! String
                realm.add(realmContact, update: true)
            }
        }
    }
}
