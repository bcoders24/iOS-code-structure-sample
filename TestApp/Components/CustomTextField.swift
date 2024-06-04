//
//  CustomTextField.swift
//  TestApp
//
//  Created by Jagdeep Singh on 03/06/24.
//

import SwiftUI

struct CustomTextField: View {
    var icon: String
    var title: String
    var hint: String
    @Binding var value: String
    @Binding var activeField: String?
    var isPassword: Bool = false
    
    @State private var showPassword: Bool = false
    @FocusState private var isFocused: Bool
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 14,weight: .medium))
            
            HStack (spacing: 12){
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                if isPassword {
                    Group {
                        if showPassword {
                            TextField("", text: $value, prompt: Text(hint))
                                .focused($isFocused)
                                .ignoresSafeArea(.keyboard, edges: .bottom)
                        }else {
                            SecureField("", text: $value, prompt: Text(hint))
                                .focused($isFocused)
                                .ignoresSafeArea(.keyboard, edges: .bottom)
                        }
                    }
                }else {
                    TextField("", text: $value, prompt: Text(hint))
                        .focused($isFocused)
                        .ignoresSafeArea(.keyboard, edges: .bottom)
                }
                
                if isPassword {
                    Button(action: {
                        withAnimation(.snappy) {
                            showPassword.toggle()
                        }
                    }, label: {
                        Image(showPassword ? .eyeCloseIcon : .eyeOpenIcon)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.gray)
                    })
                    .frame(height: 20)
                }
               
            }
            .padding(.horizontal)
            .frame(height: 50)
            .background(.ultraThinMaterial, in: .rect(cornerRadius: 12))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.linearGradient(colors: [
                        .white.opacity(0.6),
                        .clear,
                        .purple.opacity(0.2),
                        .purple.opacity(0.5)
                    ], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 0.6)
            }

        }
        .foregroundStyle(.white)
    }
}

#Preview {
    CustomTextField(icon: "person_icon", title: "Email Address", hint: "Enter email address", value: .constant(""), activeField: .constant(nil), isPassword: true)
        .preferredColorScheme(.dark)
}
