//
//  SplashView.swift
//  TestApp
//
//  Created by Jagdeep Singh on 05/06/24.
//

import SwiftUI

struct SplashView: View {
    @State private var animate: Bool = false
    @State private var goToLogin: Bool = false
    @State private var goToHome: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
               BackgroundScreen()
                
               ///Main Content
                VStack {
                    Text("Welcome to \n\(Constants.shared.appName)")
                        .font(.system(size: 50, weight: .black, design: .serif))
                        .fontWeight(.black)
                        .multilineTextAlignment(.center)
                        .scaleEffect(animate ? 1 : 0.2)
                }
            }
            .preferredColorScheme(.dark)
            .onAppear {
                
                withAnimation(.smooth(duration: 0.5)) {
                    animate = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    let isLoggedIn = (UserDefaults.standard.value(forKey: "isLoggedIn") as? Bool) ?? false
                    if isLoggedIn {
                        goToHome = true
                    }else {
                        goToLogin = true
                    }
                    animate = false

                }
            }
            .navigationDestination(isPresented: $goToLogin) {
                LoginView()
                    .navigationBarBackButtonHidden()
            }
            .navigationDestination(isPresented: $goToHome) {
                HomeView()
                    .navigationBarBackButtonHidden()
            }
            
        }
    }
}

#Preview {
    SplashView()
}
