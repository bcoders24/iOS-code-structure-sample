//
//  ContentView.swift
//  TestApp
//
//  Created by Jagdeep Singh on 03/06/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    @State private var path: NavigationPath = .init()
    var body: some View {
        SplashView()
    }
}

#Preview {
    ContentView()
}
