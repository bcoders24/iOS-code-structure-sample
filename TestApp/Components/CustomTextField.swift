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
    var isPassword: Bool = false
    
    @State private var showPassword: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 16,weight: .medium))
                .kerning(0.9)
            
            HStack (spacing: 12){
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                if isPassword {
                    Group {
                        if showPassword {
                            TextField("", text: $value, prompt: Text(hint))

                        }else {
                            SecureField("", text: $value, prompt: Text(hint))

                        }
                    }
                }else {
                    TextField("", text: $value, prompt: Text(hint))

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
                    .stroke(.gray, lineWidth: 0.5)
            }

        }
        .foregroundStyle(.white)
    }
}

#Preview {
    CustomTextField(icon: "person_icon", title: "Email Address", hint: "Enter email address", value: .constant(""), isPassword: true)
        .preferredColorScheme(.dark)
}
