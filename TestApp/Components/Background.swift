//
//  Background.swift
//  TestApp
//
//  Created by Jagdeep Singh on 03/06/24.
//

import SwiftUI

struct Background: View {
    var body: some View {
        GeometryReader {
            let size = $0.size
            Color.black
            VStack {
                Image(.heroImageOne)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size.width)
                    .overlay(alignment: .bottomLeading) {
                        Circle()
                            .fill(.purple.gradient)
                            .frame(width: 40, height: 40)
                            .blur(radius: 6)
                    }
                    .overlay(alignment: .bottomTrailing) {
                        Circle()
                            .fill(.purple.gradient)
                            .frame(width: 50, height: 50)
                            .blur(radius: 16)
                            .offset(y: 40)
                    }
                
                Spacer()
                
                HStack {
                    Circle()
                        .fill(.orange)
                        .frame(width: 150, height: 150)
                        .blur(radius: 50)
                    Spacer()
                    Circle()
                        .fill(.purple)
                        .frame(width: 100, height: 100)
                        .blur(radius: 40)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Background()
}
