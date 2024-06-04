//
//  SocialButton.swift
//  TestApp
//
//  Created by Jagdeep Singh on 03/06/24.
//

import SwiftUI

struct SocialButton: View {
    var icon: String
    var isRendering: Bool = false
    var action: ()->()
    var body: some View {
        Button(action: action){
            Image(icon)
                .resizable()
                .renderingMode(isRendering ? .template : .original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .foregroundStyle(.white)
            
        }
    }
}

#Preview {
    SocialButton(icon: "apple_icon", isRendering: true) {
        
    }
    
}
