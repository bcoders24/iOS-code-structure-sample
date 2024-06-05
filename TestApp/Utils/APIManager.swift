//
//  APIManager.swift
//  TestApp
//
//  Created by Jagdeep Singh on 05/06/24.
//

import SwiftUI
import Alamofire

final class APIManager {
    static let shared = APIManager()
    private init () {}
    
    func login(_ email: String, password: String, completion: @escaping (UserModel?, String)->Void){
        let url: String = "\(Constants.shared.baseURL)/api/auths/login"
        let deviceID = UIDevice.current.identifierForVendor!.uuidString
        let params: Parameters = [
            "email": email,
            "password": password,
            "deviceType": "ios",
            "deviceId": deviceID
        ]
        
        let request = AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
        request.responseDecodable(of: UserMainModel.self) { response in
            let result = response.result
            switch result {
            case .success(let success):
                if success.isSuccess ?? false {
                    completion(success.data, "")
                }else {
                    completion(nil, success.message ?? "")
                }
                
            case .failure(let failure):
                completion(nil, failure.localizedDescription)
            }
        }
    }
    
    func signup(_ email: String, password: String, completion: @escaping (UserModel?, String)->Void){
        let url: String = "\(Constants.shared.baseURL)/api/auths/signup"
        let params: Parameters = [
            "email": email,
            "password": password,
            "authMethod": "email"
        ]
        
        let request = AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
        request.responseDecodable(of: UserMainModel.self) { response in
            let result = response.result
            switch result {
            case .success(let success):
                if success.isSuccess ?? false {
                    completion(success.data, "")
                }else {
                    completion(nil, success.message ?? "")
                }
                
            case .failure(let failure):
                completion(nil, failure.localizedDescription)
            }
        }
    }
}


