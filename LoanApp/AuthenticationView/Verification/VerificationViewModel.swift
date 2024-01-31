//
//  VerificationViewModel.swift
//  LoanApp
//
//  Created by TBAM on 29/01/2024.
//

import Foundation

protocol VerificationDelegate: AnyObject {
    func verificationDidSucceed(response: VerificationResponseModel)
    func verificationDidFail(error: Error)
}


class VerificationViewModel{
    var networkCall: NetworkCall
    init(networkCall: NetworkCall, delegate: VerificationDelegate? = nil) {
        self.networkCall = networkCall
        self.delegate = delegate
    }
    
    weak var delegate: VerificationDelegate?
    
    
    @MainActor
    func verifyOtp(otp: VerificationModel) async{
        do{
            let apiEndpointURL = URL(string: "https://ab78-102-88-70-102.ngrok-free.app/api/User/validate")!
            
            let verify = try await networkCall.VerificationApiCall(url: apiEndpointURL, httpMethod: "POST", httpBodyPayload: otp.apiRequestBody)
            delegate?.verificationDidSucceed(response: verify!)
        }catch{
            delegate?.verificationDidFail(error: error)
        }
    }
}
