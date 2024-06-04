//
//  LoginView.swift
//  TestApp
//
//  Created by Jagdeep Singh on 03/06/24.
//

import SwiftUI

struct LoginView: View {
    var viewModel: AuthViewModel = .init()
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
                           TitleAndMessageView(title: "Welcome Back!", message: "Please enter your credentials to access your account.")
                                .padding(.top, 5)
                            
                            VStack(spacing: 12) {
                                CustomTextField(icon: "person_icon", title: "Email Address", hint: "Enter your email address", value: .init(get: {
                                    viewModel.email
                                }, set: { value in
                                    viewModel.email = value
                                }))
                                
                                CustomTextField(icon: "key_icon", title: "Password", hint: "Enter your password", value: .init(get: {
                                    viewModel.password
                                }, set: { value in
                                    viewModel.password = value
                                }), isPassword: true)
                                
                                NavigationLink {
                                    
                                } label: {
                                    Text("Forgot Password?")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundStyle(.gray)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .padding(.bottom, 4)
                                }
                                
                                CustomButton(title: "Sign in") {
                                    
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
                                        
                                    } label: {
                                        Text("Sign up")
                                            .fontWeight(.bold)
                                    }
                                }
                                .font(.system(size: 14, weight: .medium))
                                .padding(.top, 15)
                            }
                            .safeAreaPadding(.horizontal, 15)
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .ignoresSafeArea()
                .padding(.top, 170)
        }
        .preferredColorScheme(.dark)
    }
    
}

#Preview {
    LoginView()
}

