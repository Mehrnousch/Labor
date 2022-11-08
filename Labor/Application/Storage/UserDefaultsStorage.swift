//
//  UserDefaultsStorage.swift
//  Labor
//
//  Created by mehrnoush abdinian on 29.08.22.
//

import UIKit

class UserDefaultsStorage {
    
    static let shared: UserDefaultsStorage = UserDefaultsStorage()
    private let token = "token"
    private let calendarStartExperiment = "startTime"
    private let calendarEndExperiment = "endTime"
    private let description = "description"

    var accountToken: String? {
        get { return getString(token) }
        set { setString(token, value: newValue) }
    }
    
    var startExperiment: Double {
        get { return double(for: calendarStartExperiment) }
        set { set(newValue, for: calendarStartExperiment) }
    }
    
    var endExperiment: Double {
        get { return double(for: calendarEndExperiment) }
        set { set(newValue, for: calendarEndExperiment) }
    }
    
    var descriptionExperiment: String? {
        get { return getString(description) }
        set { setString(description, value: newValue) }
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
