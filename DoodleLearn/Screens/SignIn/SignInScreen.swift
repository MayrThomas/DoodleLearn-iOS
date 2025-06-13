//
//  SignInScreen.swift
//  DoodleLearn
//
//  Created by Thomas Mayr on 13.06.25.
//

import SwiftUI

struct SignInScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var loginStarted: Bool = false
    
    var body: some View {
        VStack {
            Text("Doodle Learn")
                .font(.title)
                .padding(.bottom, 40)
            
            TextField("Email", text: $email).keyboardType(UIKeyboardType.emailAddress)
                .textContentType(.emailAddress)
                .autocorrectionDisabled(true)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black)
                )
                .padding()
            
            if loginStarted {
                ZStack(alignment: .trailing) {
                    if showPassword {
                        TextField("Password", text: $password)
                            .textContentType(.password)
                            .autocorrectionDisabled(true)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black)
                            )
                            .padding(.horizontal)
                    } else {
                        SecureField("Password", text: $password)
                            .textContentType(.password)
                            .autocorrectionDisabled(true)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black)
                            )
                            .padding(.horizontal)
                    }
                    
                    Button(action: {
                        showPassword = !showPassword
                    }, label: {
                        Image(systemName: !showPassword ? "eye" : "eye.slash")
                            .foregroundStyle(.gray)
                            .padding()
                            .padding(.trailing)
                    })
                }
            }
            
            Button(action: {
                if !loginStarted {
                    loginStarted = !loginStarted
                } else {
                    
                }
            }) {
                Text("Login")
                    .padding()
                    .foregroundStyle(.white)
            }
            .frame(width: 300, height: 40)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
            
            Button(action: {}) {
                Text("Sign Up")
            }
        }
    }
}

#Preview {
    SignInScreen()
}
