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
        prepopulateMessagesIntoRealm()
    }
    
    func prepopulateContactsIntoRealm() {
        
        let realm = try! Realm()
        let realmContacts = realm.objects(RealmContact.self)
        guard realmContacts.count == 0 else {
            return
        }
        
        let contacts = [["id":19,"name":"Robert","lastname":"Smith","phoneNumber":"193-997-4842","avatarUrl":"http://kbapi.herokuapp.com/images/10.png"],["id":92,"name":"Polly","lastname":"Davis","phoneNumber":"710-387-7956","avatarUrl":"https://www.indiewire.com/wp-content/uploads/2016/09/south-park_2001_cartman.jpg?w=780"],["id":49,"name":"Richard","lastname":"Stevens","phoneNumber":"319-800-1221","avatarUrl":"http://kbapi.herokuapp.com/images/3.png"],["id":43,"name":"Eve","lastname":"Andrews","phoneNumber":"669-326-10994","avatarUrl":"https://www.indiewire.com/wp-content/uploads/2016/09/south-park_2001_cartman.jpg?w=780"],["id":63,"name":"Karen","lastname":"Robinson","phoneNumber":"650-685-9539","avatarUrl":"http://kbapi.herokuapp.com/images/10.png"],["id":77,"name":"Richard","lastname":"Edwards","phoneNumber":"926-955-5915","avatarUrl":"http://kbapi.herokuapp.com/images/9.png"],["id":91,"name":"Matthew","lastname":"Harrison","phoneNumber":"491-781-8649","avatarUrl":"http://kbapi.herokuapp.com/images/4.png"],["id":51,"name":"Susan","lastname":"Peters","phoneNumber":"206-441-8082","avatarUrl":"http://kbapi.herokuapp.com/images/8.png"],["id":80,"name":"Diana","lastname":"Kirk","phoneNumber":"214-256-8833","avatarUrl":"http://kbapi.herokuapp.com/images/10.png"],["id":83,"name":"Kimberly","lastname":"Harris","phoneNumber":"990-403-4758","avatarUrl":"http://kbapi.herokuapp.com/images/2.png"],["id":38,"name":"Maria","lastname":"Grant","phoneNumber":"460-941-2788","avatarUrl":"http://kbapi.herokuapp.com/images/9.png"],["id":2,"name":"Helen","lastname":"Robinson","phoneNumber":"814-671-6121","avatarUrl":"http://kbapi.herokuapp.com/images/4.png"],["id":53,"name":"Joseph","lastname":"Kirby","phoneNumber":"325-398-5670","avatarUrl":"https://www.indiewire.com/wp-content/uploads/2016/09/south-park_2001_cartman.jpg?w=780"],["id":28,"name":"Kimberly","lastname":"Lake","phoneNumber":"908-862-9335","avatarUrl":"http://kbapi.herokuapp.com/images/4.png"],["id":84,"name":"Philip","lastname":"Lewis","phoneNumber":"882-794-3049","avatarUrl":"http://kbapi.herokuapp.com/images/5.png"]]
        
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
    
    func prepopulateMessagesIntoRealm() {
        
        let realm = try! Realm()
        let realmMessages = realm.objects(RealmChatRoomConversation.self)
        guard realmMessages.count == 0 else {
            return
        }
        
        let messages = [["id":33,"chat_room_id":3,"from_id":24,"to_id":2,"timestamp":"2018-10-18","message":"Down the road ","isReaded":false],["id":80,"chat_room_id":60,"from_id":83,"to_id":60,"timestamp":"2018-10-17","message":"Maybe tomorrow I'll want to settle down - until tomorrow I'll just keep moving on. \n\nI might jump an open drawbridge or Tarzan from a vine, beause I'm the unknown stuntman that makes Eastwood look so fine. Lorem ipsum dolor sit amet  consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","isReaded":false],["id":72,"chat_room_id":22,"from_id":55,"to_id":2,"timestamp":"2018-10-13","message":"Hong Kong Phooey number one super guy, Hong Kong Phooey quicker than the human eye. \n\nDown the road that's where I'll always be. He just keeps on movin' and ladies keep improvin'. Every day is better than the last, with new dreams and better scenes and best of all I don't pay property tax. Off to New Orleans or who knows where.","isReaded":true],["id":40,"chat_room_id":56,"from_id":13,"to_id":58,"timestamp":"2018-11-01","message":"Maybe","isReaded":true],["id":69,"chat_room_id":47,"from_id":98,"to_id":81,"timestamp":"2018-10-23","message":"Lorem ipsum dolor sit amet  consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Excepteur sint occaecat cupidatat non proident  sunt in culpa qui officia deserunt mollit anim id est laborum. Soaring through all the galaxies in search of Earth flying in to the night. He's going everywhere, B.J. McKay and his best friend Bear. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \n\nUlysses, fighting evil and tyranny with all his power and with all of his might. Off to New Orleans or who knows where.","isReaded":true],["id":4,"chat_room_id":90,"from_id":3,"to_id":72,"timestamp":"2018-10-16","message":"Rolling  down to Dallas - who is providin' my palace?. Ulysses, fighting evil and tyranny with all his power and with all of his might. Off to New Orleans or who knows where. \n\nWho says you have to call just one place home?.","isReaded":true],["id":19,"chat_room_id":32,"from_id":77,"to_id":48,"timestamp":"2018-10-27","message":"Rolling  down to Dallas - who is providin' my palace?. Always fighting all the evil forces bringing peace and justice to all. Hong Kong Phooey number one super guy, Hong Kong Phooey quicker than the human eye. \n\nEvery day is better than the last, with new dreams and better scenes and best of all I don't pay property tax. Excepteur sint occaecat cupidatat non proident  sunt in culpa qui officia deserunt mollit anim id est laborum. Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Who says you have to call just one place home?.","isReaded":false],["id":68,"chat_room_id":10,"from_id":73,"to_id":54,"timestamp":"2018-10-14","message":"Ulysses, fighting evil and tyranny with all his power and with all of his might. He just keeps on movin' and ladies keep improvin'. Off to New Orleans or who knows where. Maybe tomorrow I'll want to settle down - until tomorrow I'll just keep moving on. He just keeps on movin' and ladies keep improvin'. \n\nExcepteur sint occaecat cupidatat non proident  sunt in culpa qui officia deserunt mollit anim id est laborum.","isReaded":true],["id":97,"chat_room_id":25,"from_id":62,"to_id":16,"timestamp":"2018-10-22","message":"He's got style","isReaded":false],["id":84,"chat_room_id":40,"from_id":60,"to_id":67,"timestamp":"2018-10-21","message":"Hey there where ya goin, not exactly knowin'. \n\nHe's got style, a groovy style, and a car that just won't stop.","isReaded":true],["id":6,"chat_room_id":69,"from_id":3,"to_id":90,"timestamp":"2018-11-01","message":"Excepteur sint occaecat cupidatat non proident  sunt in culpa qui officia deserunt mollit anim id est laborum. Soaring through all the galaxies in search of Earth flying in to the night. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. There's a voice that keeps on calling me. \n\nEvery day is better than the last, with new dreams and better scenes and best of all I don't pay property tax. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Off to New Orleans or who knows where. Soaring through all the galaxies in search of Earth flying in to the night. Always fighting all the evil forces bringing peace and justice to all.","isReaded":true],["id":62,"chat_room_id":10,"from_id":50,"to_id":32,"timestamp":"2018-11-01","message":"Lorem ipsum dolor sit amet  consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n\nHe's got style, a groovy style, and a car that just won't stop. Hey there where ya goin, not exactly knowin'. He just keeps on movin' and ladies keep improvin'.","isReaded":true],["id":69,"chat_room_id":15,"from_id":37,"to_id":28,"timestamp":"2018-10-20","message":"Hong Kong Phooey number one super guy, Hong Kong Phooey quicker than the human eye. Every stop I make I make a new friend; Can't stay for long just turn around and I'm gone again. I might jump an open drawbridge or Tarzan from a vine, beause I'm the unknown stuntman that makes Eastwood look so fine. \n\nWho says you have to call just one place home?.","isReaded":false],["id":10,"chat_room_id":35,"from_id":18,"to_id":15,"timestamp":"2018-10-22","message":"Hey there where ya goin, not exactly knowin'. No-one else can do the things you do, like a bolt of thunder from the blue. Off to New Orleans or who knows where. Ulysses, fighting evil and tyranny with all his power and with all of his might. \n\nHe's got style, a groovy style, and a car that just won't stop.","isReaded":false],["id":57,"chat_room_id":54,"from_id":75,"to_id":83,"timestamp":"2018-10-25","message":"Off to New Orleans or who knows where. \n\nHe's going everywhere, B.J. McKay and his best friend Bear.","isReaded":false],["id":97,"chat_room_id":36,"from_id":81,"to_id":17,"timestamp":"2018-10-30","message":"Every day is better than the last, with new dreams and better scenes and best of all I don't pay property tax. \n\nDown the road that's where I'll always be.","isReaded":true],["id":67,"chat_room_id":78,"from_id":1,"to_id":25,"timestamp":"2018-10-29","message":"No-one else can do the things you do, like a bolt of thunder from the blue. Every day is better than the last, with new dreams and better scenes and best of all I don't pay property tax. \n\nI've gotten burned over Cheryl Tiegs and blown up for Raquel Welch, but when I end up in the hay it's only hay, hey hey. Soaring through all the galaxies in search of Earth flying in to the night.","isReaded":true],["id":50,"chat_room_id":35,"from_id":0,"to_id":39,"timestamp":"2018-10-13","message":"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \n\nMaybe tomorrow I'll want to settle down - until tomorrow I'll just keep moving on. Soaring through all the galaxies in search of Earth flying in to the night.","isReaded":true],["id":19,"chat_room_id":87,"from_id":84,"to_id":34,"timestamp":"2018-10-16","message":"Who says you have to call just one place home?. \n\nHe's going everywhere, B.J. McKay and his best friend Bear. Soaring through all the galaxies in search of Earth flying in to the night. Down the road that's where I'll always be. No-one else can do the things you do, like a bolt of thunder from the blue.","isReaded":false],["id":73,"chat_room_id":68,"from_id":11,"to_id":93,"timestamp":"2018-11-01","message":"Ulysses, fighting evil and tyranny with all his power and with all of his might. Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nUlysses, fighting evil and tyranny with all his power and with all of his might.","isReaded":false]]
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        try! realm.write {
            for message in messages {
                let realmMessage = RealmChatRoomConversation()
                let timestamp = formatter.date(from: message["timestamp"] as! String)
                
                realmMessage.id = message["id"] as! Int
                realmMessage.chat_room_id = message["chat_room_id"] as! Int
                realmMessage.from_id = message["from_id"] as! Int
                realmMessage.to_id = message["to_id"] as! Int
                realmMessage.timestamp = timestamp!
                realmMessage.message = message["message"] as! String
                realmMessage.isReaded = message["isReaded"] as! Bool
                realm.add(realmMessage, update: true)
            }
        }
    }
}
