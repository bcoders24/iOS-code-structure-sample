//
//  TitleAndMessageView.swift
//  TestApp
//
//  Created by Jagdeep Singh on 03/06/24.
//

import SwiftUI

struct TitleAndMessageView: View {
    var title: String
    var message: String
    var body: some View {
        VStack(spacing: 10){
            Text(title)
                .font(.system(size: 35, weight: .black))
            
            Text(message)
                .font(.system(size: 14, weight: .regular))
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .foregroundStyle(.white)
    }
}

#Preview {
    TitleAndMessageView(title: "Sample Title", message: "Sample Message")
}
