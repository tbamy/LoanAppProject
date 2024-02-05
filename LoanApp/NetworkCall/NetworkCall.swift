//
//  NetworkCall.swift
//  LoanApp
//
//  Created by TBAM on 26/01/2024.
//

import Foundation
//import JSONWebToken


class NetworkCall {
    let session = URLSession.shared

    func RegisterApiCall(url: URL, httpMethod: String, httpBodyPayload: [String: Any]? = nil) async throws -> RegistrationResponseModel? {
        do {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod
            
                if let httpBodyPayload = httpBodyPayload {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: httpBodyPayload, options: [])
                }
                
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let (data, _) = try await session.data(for: urlRequest)
            let jsonDecoder = JSONDecoder()
            let registrationModel = try jsonDecoder.decode(RegistrationResponseModel.self, from: data)
            //print("This is the data sent \(registrationModel)")
            return registrationModel
        } catch {
//            print("error occured")
            throw error
        }
    }
    
    
    
    func VerificationApiCall(url: URL, httpMethod: String, httpBodyPayload: [String: Any]? = nil) async throws -> VerificationResponseModel? {
        do {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod
            
                if let httpBodyPayload = httpBodyPayload {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: httpBodyPayload, options: [])
                }
                
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let (data, _) = try await session.data(for: urlRequest)
            let jsonDecoder = JSONDecoder()
            let verificationModel = try jsonDecoder.decode(VerificationResponseModel.self, from: data)
            return verificationModel
        } catch {
//            print("error occured")
            throw error
        }
    }
    
    
    func loginApiCall(url: URL, httpMethod: String, httpBodyPayload: [String: Any]? = nil) async throws -> LoginResponseModel? {
        do {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod

            if let httpBodyPayload = httpBodyPayload {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: httpBodyPayload, options: [])
            }

            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            urlRequest.setValue("Bearer \(bearer)", forHTTPHeaderField: "Authorization")
            

            let (data, _) = try await session.data(for: urlRequest)
            let jsonDecoder = JSONDecoder()
            let loginModel = try jsonDecoder.decode(LoginResponseModel.self, from: data)
            
            return loginModel
            
        } catch {
            // Handle errors, such as decoding failure
            throw error
        }
    }
    
}





