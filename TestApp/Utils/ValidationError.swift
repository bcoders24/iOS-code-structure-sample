//
//  ValidationError.swift
//  TestApp
//
//  Created by Jagdeep Singh on 04/06/24.
//

import SwiftUI

enum ValidationError {
    case fullname
    case email
    case password
    case invalidEmail
    case invalidPassword
    
    var error: String {
        switch self {
        case .fullname:
            return "Please enter full name"
        case .email:
            return "Please enter email address"
        case .password:
            return "Please enter password"
        case .invalidEmail:
            return "Please enter a valid email address"
        case .invalidPassword:
            return "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character."
        }
    }
}
