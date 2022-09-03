//
//  KeyChainStorage.swift
//  Labor
//
//  Created by mehrnoush abdinian on 01.09.22.
//

import Foundation

class KeyChainStorage {
    
    static func getToken() -> String {
        guard let data = KeyChainManager.get() else {
            print("Failed to read password.")
            return ""
        }
        let token = String(decoding: data, as: UTF8.self)
        return token
    }
    
    static func save(token: String) {
        do {
            try KeyChainManager.save(password: token.data(using: .utf8) ?? Data())
        } catch {
            print(error)
        }
    }
}
