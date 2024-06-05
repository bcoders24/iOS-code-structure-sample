//
//  Spinner.swift
//  TestApp
//
//  Created by Jagdeep Singh on 05/06/24.
//

import SwiftUI

struct Spinner: View {
    @State private var animate: Bool = false
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            Circle()
                .trim(from: 0, to: 0.6)
                .stroke(.linearGradient(colors: [
                    .white,
                    .white.opacity(0.5)
                ], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.0)
                .frame(width: 100, height: 100)
                .rotationEffect(.init(degrees: animate ? 360 : 0))
                .animation(.linear.speed(0.5).repeatForever(autoreverses: false), value: animate)
        }
        .onAppear {
            animate = true
        }
    }
}

#Preview {
    Spinner()
}
