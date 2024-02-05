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
    var networkCall: NetworkCall
    init(networkCall: NetworkCall, delegate: LoginDelegate? = nil) {
        self.networkCall = networkCall
        self.delegate = delegate
    }
    
    weak var delegate: LoginDelegate?
    
    
    @MainActor
    func loginUser(login: LoginModel) async{
        do{
            let apiEndpointURL = URL(string: "https://fa7e-102-88-81-57.ngrok-free.app/api/User/Login")!
            
            let login = try await networkCall.loginApiCall(url: apiEndpointURL, httpMethod: "POST", httpBodyPayload: login.loginRequestBody)
            delegate?.loginDidSucceed(response: login!)
        }catch{
            delegate?.loginDidFail(error: error)
        }
    }
}
