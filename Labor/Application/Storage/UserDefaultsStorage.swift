//
//  UserDefaultsStorage.swift
//  Labor
//
//  Created by mehrnoush abdinian on 29.08.22.
//

import Foundation

class UserDefaultsStorage {
    
    static let shared: UserDefaultsStorage = UserDefaultsStorage()
    private let token = "token"

    var accountToken: String? {
        get { return getString(token) }
        set { setString(token, value: newValue) }
    }
    
    private func getString(_ name: String) -> String? {
        return UserDefaults.standard.value(forKey: name) as? String
    }
    
    private func setString(_ name: String, value: String?) {
        if let value = value {
            UserDefaults.standard.set(value, forKey: name)
        } else  {
            UserDefaults.standard.removeObject(forKey: name)
        }
        UserDefaults.standard.synchronize()
    }
    
    private func bool(for key: String) -> Bool? {
        return UserDefaults.standard.value(forKey: key) as? Bool
    }
    
    private func set(_ value: Bool, for key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    private func set(_ value: Double?, for key: String) {
        if let value = value {
            UserDefaults.standard.set(value, forKey: key)
        } else {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
    
    private func double(for key: String) -> Double {
        return UserDefaults.standard.double(forKey: key)
    }
}