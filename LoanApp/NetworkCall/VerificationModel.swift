//
//  VerificationModel.swift
//  LoanApp
//
//  Created by TBAM on 29/01/2024.
//

import Foundation

class VerificationModel{
    let otp: String
    
    init(otp: String) {
        self.otp = otp
    }
    
    var apiRequestBody: [String: String] {
        return ["otp": otp]
    }
    
}



class VerificationResponseModel: Codable{
    let message : String?
    let success: Bool?
}
