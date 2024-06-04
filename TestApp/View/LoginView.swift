//
//  LoginView.swift
//  TestApp
//
//  Created by Jagdeep Singh on 03/06/24.
//

import SwiftUI

struct LoginView: View {
    var viewModel: AuthViewModel = .init()
    
    @State private var activeField: String?
    var body: some View {
        NavigationStack {
            ZStack {
                Background()
                
                ///main Content
                UnevenRoundedRectangle(topLeadingRadius: 20, bottomLeadingRadius: .zero, bottomTrailingRadius: .zero, topTrailingRadius: 20, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .overlay {
                        ///main content
                        ScrollView(.vertical) {
                            VStack {
                               TitleAndMessageView(title: "Welcome Back!", message: "Please enter your credentials to access your account.")
                                    .padding(.top, 5)
                                
                                VStack(spacing: 12) {
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
                                    
                                    NavigationLink {
                                        
                                    } label: {
                                        Text("Forgot Password?")
                                            .font(.system(size: 14, weight: .medium))
                                            .foregroundStyle(.gray)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                            .padding(.bottom, 4)
                                    }
                                    
                                    CustomButton(title: "Sign in") {
                                        viewModel.loginUser()
                                    }
                                    
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
                                        Text("Don't have an account?")
                                        NavigationLink {
                                            SignupView()
                                                .navigationBarBackButtonHidden()
                                        } label: {
                                            Text("Sign up")
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
    
}

#Preview {
    LoginView()
}

