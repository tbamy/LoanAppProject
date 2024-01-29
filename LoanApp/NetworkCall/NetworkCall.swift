//
//  NetworkCall.swift
//  LoanApp
//
//  Created by TBAM on 26/01/2024.
//

import Foundation


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
    
    
    
    func apiCall(url: URL, httpMethod: String, httpBodyPayload: [String: Any]? = nil) async throws -> RegistrationResponseModel? {
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
    
}





