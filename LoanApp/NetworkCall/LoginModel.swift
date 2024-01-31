//
//  LoginModel.swift
//  LoanApp
//
//  Created by TBAM on 30/01/2024.
//

import Foundation

class LoginModel{
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    var loginRequestBody : [String: String]{
        return ["email": email,
                "password": password
        ]
    }
}


class LoginResponseModel: Codable{
    let token: String?
    let userDetails: userDetails?
}

class userDetails: Codable{
    let firstName: String?
    let lastName: String?
    let email: String?
}
