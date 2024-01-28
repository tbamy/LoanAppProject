//
//  NetworkCall.swift
//  LoanApp
//
//  Created by TBAM on 26/01/2024.
//

import Foundation


class NetworkCall {
    let session = URLSession.shared

    func apiCall(url: URL, httpMethod: String, httpBodyPayload: [String: Any]? = nil) async throws -> RegistrationModel? {
        do {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod
            
            
               

            if httpMethod == "POST" {
                if let httpBodyPayload = httpBodyPayload {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: httpBodyPayload, options: [])
                }
                
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }

//            print("request url is \(urlRequest)")
//            print("request httpmethod is \(urlRequest.httpMethod!)")
//            print("request body is \(urlRequest.httpBody!)")
            
            
            let (data, _) = try await session.data(from: url)
            let jsonDecoder = JSONDecoder()
            let registrationModel = try jsonDecoder.decode(RegistrationModel.self, from: data)
            //print("This is the data sent \(registrationModel)")
            return registrationModel
        } catch {
//            print("error occured")
            throw error
        }
    }
}





