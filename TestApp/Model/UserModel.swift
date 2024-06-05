//
//  UserModel.swift
//  TestApp
//
//  Created by Jagdeep Singh on 05/06/24.
//

import SwiftUI

struct UserMainModel : Codable {
    let isSuccess : Bool?
    let data : UserModel?
    let code: Int?
    let message: String?
    
    enum CodingKeys: String, CodingKey {

        case isSuccess = "isSuccess"
        case data = "data"
        case code = "code"
        case message = "message"
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isSuccess = try container.decodeIfPresent(Bool.self, forKey: .isSuccess)
        self.data = try container.decodeIfPresent(UserModel.self, forKey: .data)
        self.code = try container.decodeIfPresent(Int.self, forKey: .code)
        self.message = try container.decodeIfPresent(String.self, forKey: .message)
    }

}

struct UserModel : Codable {
    var id : String?
    var email : String?
    var isEmailVerified : Bool?
    var status : String?
    var language : String?
    var role : String?
    var createdAt : String?
    var updatedAt : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case email = "email"
        case isEmailVerified = "isEmailVerified"
        case status = "status"
        case language = "language"
        case role = "role"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        isEmailVerified = try values.decodeIfPresent(Bool.self, forKey: .isEmailVerified)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        role = try values.decodeIfPresent(String.self, forKey: .role)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
    }
    
    init(){
        
    }

}
