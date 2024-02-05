//
//  RegistrationViewModel.swift
//  LoanApp
//
//  Created by TBAM on 26/01/2024.
//

import Foundation

protocol RegistrationDelegate: AnyObject {
    func registrationDidSucceed(response: RegistrationResponseModel)
    func registrationDidFail(error: Error)
}



class RegistrationViewModel {
    
    var networkCall: NetworkCall
    
    init(networkCall: NetworkCall, delegate: RegistrationDelegate? = nil) {
        self.networkCall = networkCall
        self.delegate = delegate
    }
    
    weak var delegate: RegistrationDelegate?
    
    @MainActor
    
    func registerUser(registration: RegistrationModel) async{
        do{
            let apiEndpointURL = URL(string: "https://9fbe-102-88-33-136.ngrok-free.app/api/User/Register")!
            
//            print(registration.convertToApiRequestBody())
            
            let responseModel = try await networkCall.RegisterApiCall(url: apiEndpointURL, httpMethod: "POST", httpBodyPayload: registration.convertToApiRequestBody())

//            print("API Response: \(responseModel!)")
            delegate?.registrationDidSucceed(response: responseModel!)
            
        }catch{
//            print("Registration failed with error: \(error)")
            delegate?.registrationDidFail(error: error)
        }
    }
    
    
}
