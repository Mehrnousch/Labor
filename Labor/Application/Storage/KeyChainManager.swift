//
//  KeyChainManager.swift
//  Labor
//
//  Created by mehrnoush abdinian on 01.09.22.
//

import Foundation

class KeyChainManager {
    
    enum KeyChainErrors: Error {
        case duplicateEntry
        case unknown(OSStatus)
    }
    
    static func save(
        password: Data
    ) throws {
        print("Starting save...")
        let query: [String : AnyObject] = [
            kSecClass as String : kSecClassGenericPassword,
            kSecValueData as String : password as AnyObject
        ]
        let status = SecItemAdd(
            query as CFDictionary,
            nil)
        
        guard status != errSecDuplicateItem else {
            throw KeyChainErrors.duplicateEntry
        }
        
        guard status == errSecSuccess else {
            throw KeyChainErrors.unknown(status)
        }
        
        print("Saved")
    }

    static func get() -> Data? {
        let query: [String : AnyObject] = [
            kSecClass as String : kSecClassGenericPassword,
            kSecReturnData as String : kCFBooleanTrue,
            kSecMatchLimit as String : kSecMatchLimitOne,
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(
            query as CFDictionary,
            &result)
        
        print("Read status = \(status)")
        
        return result as? Data
    }
}
