//
//  SignupView.swift
//  TestApp
//
//  Created by Jagdeep Singh on 04/06/24.
//

import SwiftUI

struct SignupView: View {
    var viewModel: AuthViewModel = .init()
    
    @Environment(\.dismiss) private var dismiss
    @State private var activeField: String?
    var body: some View {
        ZStack {
            Background()
            
            ///main Content
            UnevenRoundedRectangle(topLeadingRadius: 20, bottomLeadingRadius: .zero, bottomTrailingRadius: .zero, topTrailingRadius: 20, style: .continuous)
                .fill(.ultraThinMaterial)
                .overlay {
                    ///main content
                    ScrollView(.vertical) {
                        VStack {
                           TitleAndMessageView(title: "Welcome!", message: "Let's get started by creating your account.")
                                .padding(.top, 5)
                            
                            VStack(spacing: 12) {
                                CustomTextField(icon: "person_icon", title: "Full Name", hint: "Enter your full name", value: .init(get: {
                                    viewModel.fullname
                                }, set: { value in
                                    viewModel.fullname = value
                                }), activeField: $activeField)
                                
                                CustomTextField(icon: "email_icon", title: "Email Address", hint: "Enter your email address", value: .init(get: {
                                    viewModel.email
                                }, set: { value in
                                    viewModel.email = value
                                }), activeField: $activeField)
                                
                                CustomTextField(icon: "key_icon", title: "Password", hint: "Enter your password", value: .init(get: {
                                    viewModel.password
                                }, set: { value in
                                    viewModel.password = value
                                }), activeField: $activeField, isPassword: true)
                                
                                CustomButton(title: "Sign up") {
                                    viewModel.signupUser()
                                }
                                .padding(.top, 15)
                                
                                OptionsMessageView(message: "Or continue with")
                                    .padding(.vertical)

                                HStack (spacing: 40){
                                    SocialButton(icon: "google_icon") {
                                        
                                    }
                                    
                                    SocialButton(icon: "facebook_icon") {
                                        
                                    }
                                    
                                    SocialButton(icon: "apple_icon", isRendering: true) {
                                        
                                    }
                                }
                                
                                HStack {
                                    Text("Alread have an account?")
                                    Button {
                                        dismiss()
                                    } label: {
                                        Text("Login")
                                            .fontWeight(.bold)
                                    }
                                }
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(.white)
                                .padding(.top, 15)
                            }
                            .safeAreaPadding(.horizontal, 15)
                            .safeAreaPadding(.bottom, 30)
                        }
                    }
                    .scrollIndicators(.hidden)
                    .keyboardAware()
                }
                .ignoresSafeArea()
                .padding(.top, 170)
        }
        .preferredColorScheme(.dark)
        .showAlert(.init(get: {
            viewModel.showAlert
        }, set: { value in
            viewModel.showAlert = value
        }), message: viewModel.alertMessage)
    }
}

#Preview {
    SignupView()
}
