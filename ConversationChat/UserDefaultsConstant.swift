//
//  UserDefaultsConstant.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 10/11/18.
//  Copyright © 2018 Raul Mantilla. All rights reserved.
//

import Foundation

enum UserDefaultsConstant : String {
    case AuthToken, CurrentUser
    
    static let defaults = UserDefaults.standard
    
    //Store
    func setValue(value : Any) {
        switch self {
        case .AuthToken:
            if let _ = value as? String {
                UserDefaults.standard.set(value, forKey: self.rawValue)
            }
        case .CurrentUser:
            if let realmValue = value as? RealmContact {
                let currentContact = Contact(withRealmContact: realmValue)
                let encodedData = try? PropertyListEncoder().encode(currentContact)
                UserDefaults.standard.set(encodedData, forKey: "currentUser")
            }
        }
        UserDefaults.standard.synchronize()
    }
    
    //Retrieve
    func getValue() -> Any? {
        switch self {
        case .AuthToken:
            if(UserDefaults.standard.value(forKey: UserDefaultsConstant.AuthToken.rawValue) != nil) {
                return (UserDefaults.standard.value(forKey: UserDefaultsConstant.AuthToken.rawValue) as! String)
            }
            else {
                return ""
            }
        case .CurrentUser:
            if let data = UserDefaults.standard.value(forKey: "currentUser") as? Data {
                let userData = try? PropertyListDecoder().decode(Contact.self, from: data)
                return userData
            } else {
                return ""
            }
        }
    }
    
    //Remove
    func removeValue() {
        UserDefaults.standard.removeObject(forKey: self.rawValue)
        UserDefaults.standard.synchronize()
    }
}
