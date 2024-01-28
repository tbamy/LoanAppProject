//
//  RegistrationModel.swift
//  LoanApp
//
//  Created by TBAM on 26/01/2024.
//

import Foundation

class RegistrationModel: Codable{
    let name: String
    let email: String
    let password: String
    
    init(name: String, email: String, password: String) {
            self.name = name
            self.email = email
            self.password = password
        }
    
    func convertToApiRequestBody() -> [String: String] {
        let names = name.split(separator: " ")
        let firstName = String(names.first ?? "")
        let lastName = String(names.dropFirst().joined(separator: " "))
        
        return [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "password": password
        ]
    }
}



