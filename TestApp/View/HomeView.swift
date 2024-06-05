//
//  HomeView.swift
//  TestApp
//
//  Created by Jagdeep Singh on 04/06/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
           BackgroundScreen()
            
           ///Main Content
            VStack {
                Text("Welcome to \n\(Constants.shared.appName)")
                    .font(.system(size: 50, weight: .black, design: .serif))
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                
                Image(.heroImageTwo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screen.width - 40, height: screen.width - 40)
                    .shadow(color: .white.opacity(0.25), radius: 12, x: 0, y: 0)
            }
        }
        .preferredColorScheme(.dark)
        .overlay(alignment: .bottomTrailing) {
            Button(action: {
                UserDefaults.standard.setValue(false, forKey: "isLoggedIn")
                NavigationUtil.popToRootView(animated: true)
            }, label: {
                Text("Logout")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 25)
                    .padding(.vertical, 12)
                    .background(.ultraThinMaterial, in: .capsule)
                    .clipShape(.capsule)
                    .shadow(color: .white.opacity(0.25), radius: 8, x: 3, y:3)
                    .padding(.trailing)
                    .padding(.bottom, safeArea.bottom > 0 ? 0 : 15)
            })
        }
    }
   
}

struct BackgroundScreen: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.orange)
                .frame(width: 150, height: 150)
                .hSpacing(.leading)
                .vSpacing(.top)
                .offset(x: -75)
                .blur(radius: 30)
            Circle()
                .fill(.purple)
                .frame(width: 150, height: 150)
                .hSpacing(.trailing)
                .vSpacing(.top)
                .offset(x: 75, y: 150)
                .blur(radius: 30)
            
            Circle()
                .fill(.orange)
                .frame(width: 150, height: 150)
                .hSpacing(.leading)
                .vSpacing(.bottom)
                .offset(x: -75)
                .blur(radius: 30)
            
            Circle()
                .fill(.purple)
                .frame(width: 150, height: 150)
                .hSpacing(.trailing)
                .vSpacing(.bottom)
                .offset(x: 75, y: -50)
                .blur(radius: 30)
            
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    HomeView()
}
