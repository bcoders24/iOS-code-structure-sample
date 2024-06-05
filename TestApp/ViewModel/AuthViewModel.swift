//
//  AuthViewModel.swift
//  TestApp
//
//  Created by Jagdeep Singh on 03/06/24.
//

import SwiftUI

/// Observable Class - AuthViewModel will be handling the login and signup process alongwith all validations for user.
@Observable
class AuthViewModel {
    var fullname: String = ""
    var email: String = ""
    var password: String = ""
    var showAlert: Bool = false
    var alertMessage: String = ""
    var goToHome: Bool = false
    /// Method to `Login` the user in the app.
    var showLoading: Bool = false
    func loginUser(){
        if email.isEmptyString {
            self.showAlert(ValidationError.email.error)
        }else if password.isEmptyString {
            self.showAlert(ValidationError.password.error)
        }else {
            ///all set, call the api
            self.showLoading = true
            APIManager.shared.login(email, password: password) { user, error in
                self.showLoading = false
                if let user {
                    UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
                    UserDefaults.standard.setValue(user.email, forKey: "loggedInUser")
                    UserDefaults.standard.synchronize()
                    self.email = ""
                    self.password = ""
                    self.goToHome = true
                }else {
                    self.showAlert(error)
                }
            }
        }
    }
    
    /// Method to `Signup` the user in the app.
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
            self.showLoading = true
            APIManager.shared.signup(email, password: password) { user, error in
                self.showLoading = false
                if let user {
                    UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
                    UserDefaults.standard.setValue(user.email, forKey: "loggedInUser")
                    UserDefaults.standard.synchronize()
                    self.fullname = ""
                    self.email = ""
                    self.password = ""
                    self.goToHome = true
                }else {
                    self.showAlert(error)
                }
            }
        }
    }
    
    ///This method will `trigger` the alert if any validation during login or signup process `fails`.
    private func showAlert(_ message: String){
        DispatchQueue.main.async {
            self.alertMessage = message
            self.showAlert = true
        }
    }
}
