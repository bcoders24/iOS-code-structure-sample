//
//  OptionsMessageView.swift
//  TestApp
//
//  Created by Jagdeep Singh on 03/06/24.
//

import SwiftUI

struct OptionsMessageView: View {
    var message: String
    var body: some View {
        HStack {
            Rectangle()
                .fill(.linearGradient(colors: [
                    .clear,
                    .white
                ], startPoint: .leading, endPoint: .trailing))
                .frame(height: 0.5)
            Text(message)
                .font(.system(size: 14))
                .foregroundStyle(.white.opacity(0.8))
            Rectangle()
                .fill(.linearGradient(colors: [
                    .clear,
                    .white
                ], startPoint: .trailing, endPoint: .leading))
                .frame(height: 0.5)
                
        }
    }
}

#Preview {
    OptionsMessageView(message: "Or continue with")
        .preferredColorScheme(.dark)
}
