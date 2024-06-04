//
//  AuthViewModel.swift
//  TestApp
//
//  Created by Jagdeep Singh on 03/06/24.
//

import SwiftUI

@Observable
class AuthViewModel {
    var fullname: String = ""
    var email: String = ""
    var password: String = ""
    var showAlert: Bool = false
    var alertMessage: String = ""
    
    func loginUser(){
        if email.isEmptyString {
            self.showAlert(ValidationError.email.error)
        }else if password.isEmptyString {
            self.showAlert(ValidationError.password.error)
        }else {
            ///all set, call the api
            
        }
    }
    
    func signupUser(){
        if fullname.isEmptyString {
            self.showAlert(ValidationError.fullname.error)
        }else if email.isEmptyString {
            self.showAlert(ValidationError.email.error)
        }else if !email.isValidEmail {
            self.showAlert(ValidationError.invalidEmail.error)
        }else if password.isEmptyString {
            self.showAlert(ValidationError.password.error)
        }else if !password.isValidPassword {
            self.showAlert(ValidationError.invalidPassword.error)
        }else {
            ///all set, call the api
            
        }
    }
    
    private func showAlert(_ message: String){
        DispatchQueue.main.async {
            self.alertMessage = message
            self.showAlert = true
        }
    }
}
