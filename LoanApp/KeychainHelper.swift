//
//  KeychainHelper.swift
//  LoanApp
//
//  Created by TBAM on 01/02/2024.
//

import Foundation
final class KeychainHelper {
    
    static let standard = KeychainHelper()
    private init() {}
    
    
    func save(_ data: Data, service: String, account: String) {
        // Create query for adding or updating
        let query = [
            kSecValueData: data,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
        ] as CFDictionary

        // Try to add the item to the keychain
        let status = SecItemAdd(query, nil)

        if status == errSecSuccess {
            // Successfully added the item to the keychain
            return
        } else if status == errSecDuplicateItem {
            // Item already exists, try to update it instead
            let query = [
                kSecAttrService: service,
                kSecAttrAccount: account,
                kSecClass: kSecClassGenericPassword,
            ] as CFDictionary

            let attributesToUpdate = [kSecValueData: data] as CFDictionary

            // Update existing item
            let updateStatus = SecItemUpdate(query, attributesToUpdate)

            if updateStatus != errSecSuccess {
                // Print out the error for update
                print("Error updating item: \(updateStatus)")
            }
        } else {
            // Print out the error for add
            print("Error adding item: \(status)")
        }
    }

    
    
    func read(service: String, account: String) -> Data? {
        
        let query = [
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: true
        ] as CFDictionary
        
        var result: AnyObject?
        SecItemCopyMatching(query, &result)
        
        return (result as? Data)
    }
    
    
    
    func deleteAllItems() {
        // Create a query to match all items
        let query = [
            kSecClass: kSecClassGenericPassword,
        ] as CFDictionary

        // Delete all items that match the query
        let status = SecItemDelete(query)

        if status != errSecSuccess {
            // Print out the error
            print("Error deleting items: \(status)")
        }
    }
}
