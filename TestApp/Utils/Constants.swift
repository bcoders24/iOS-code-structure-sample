//
//  Constants.swift
//  TestApp
//
//  Created by Jagdeep Singh on 04/06/24.
//

import SwiftUI

final class Constants {
    static let shared = Constants()
    private init() {}
    
    let appName: String = "TestApp"
    let baseURL: String = "https://mytuur.bcoder.co.in"
    ///Navigation Destinations
    let goToHomeFromLogin = "home"
    let goToHomeFromSignup = "home"
    let signup = "signup"
}
