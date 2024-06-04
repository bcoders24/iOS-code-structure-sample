//
//  CustomButton.swift
//  TestApp
//
//  Created by Jagdeep Singh on 03/06/24.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: ()->()
    var body: some View {
        Button(action: action){
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(.linearGradient(colors: [
                    .pink.opacity(0.5),
                    .red
                ], startPoint: .leading, endPoint: .trailing), in: .rect(cornerRadius: 12))
        }
    }
}

#Preview {
    CustomButton(title: "Sign in") {
        
    }
    .preferredColorScheme(.dark)
}
