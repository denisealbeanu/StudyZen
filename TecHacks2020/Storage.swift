//
//  Storage.swift
//  TecHacks2020
//
//  Created by Angela Du on 2020-08-15.
//  Copyright © 2020 Angela Du. All rights reserved.
//

import Foundation

protocol Storage {
    func store(key: String, object: Any)
    func retrieve(key: String) -> Any?
}


class UserDefaultsStorage: Storage {
    func store(key: String, object: Any) {
        print("Stored!")
        UserDefaults.standard.set(object, forKey: key)
    }
    
    func retrieve(key: String) -> Any? {
        print("Retrieved!@")
        return UserDefaults.standard.object(forKey: key)
    }
}
