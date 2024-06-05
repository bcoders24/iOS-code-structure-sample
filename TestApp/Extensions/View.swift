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
    
    ///Using this extension instead of spacer
    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center)-> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    ///Using this extenion instead of spacer
    @ViewBuilder
    func vSpacing(_ alignment: Alignment = .center)-> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    var screen: CGRect {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return .zero }
        return window.screen.bounds
    }
    
    var safeArea: UIEdgeInsets {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return .zero }
        guard let safeArea = window.keyWindow?.safeAreaInsets else { return .zero }
        return safeArea
    }
}
