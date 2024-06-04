//
//  View.swift
//  TestApp
//
//  Created by Jagdeep Singh on 04/06/24.
//

import SwiftUI

extension View {
    /// Show Alert
    @ViewBuilder
    func showAlert(_ isPresented: Binding<Bool>, message: String)-> some View {
        self
            .alert(Constants.shared.appName, isPresented: isPresented) {
                
            } message: {
                Text(message)
            }

    }
}
