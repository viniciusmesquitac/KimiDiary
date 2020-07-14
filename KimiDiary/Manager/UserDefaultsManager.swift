//
//  UserDefaultsManager.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 14/07/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//

import UIKit

enum UserLoggedState {
    case firstLogin
    case alreadyLogged
}

enum UserDefaultsKey: String {
   case userName
   case bornDate
    
    // others atributes are added here
}

struct UserDefaultsManager {
    
    static func verifyState(completion: (UserLoggedState) -> ()) {
        
        let userDefaults = UserDefaults.standard
    
        if UserDefaults.standard.bool(forKey: "firstLogin") != true {
            userDefaults.set(true, forKey: "firstLogin")
            completion(.firstLogin)
            
        } else if userDefaults.string(forKey: "userName") == nil {
            completion(.alreadyLogged)
        }
    }
    
    static func setUser(name: String?, bornDate: Date?) {
        
        guard let name = name, let bornDate = bornDate else { return }
        UserDefaults.standard.set(name, forKey: UserDefaultsKey.userName.rawValue)
        UserDefaults.standard.set(bornDate, forKey: UserDefaultsKey.bornDate.rawValue)
        
     }
    
    static func setUserName(name: String?) {
        UserDefaults.standard.set(name, forKey: UserDefaultsKey.userName.rawValue)
    }
    
    static func fetchString(withUserDefaultKey userDefaultKey: UserDefaultsKey) -> String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: userDefaultKey.rawValue)
    }
    
}
