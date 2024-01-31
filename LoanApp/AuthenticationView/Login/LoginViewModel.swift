//
//  LoginViewModel.swift
//  LoanApp
//
//  Created by TBAM on 30/01/2024.
//

import Foundation


protocol LoginDelegate: AnyObject {
    func loginDidSucceed(response: LoginResponseModel)
    func loginDidFail(error: Error)
}

class LoginViewModel{
    
}
