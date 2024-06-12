//
//  SwiftUIView.swift
//  NutriGo
//
//  Created by Saul Ramirez on 11/06/24.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var viewModel: LoginViewModel
    var body: some View {
        VStack{
       
            Spacer()
            IconTextField(
                icon: "envelope",
                value: $viewModel.email,
                label: "LoginScreen.emailTextField".localized(),
                keyboardType: .emailAddress
            )
            IconTextField(
                icon: "lock",
                value: $viewModel.password,
                label: "LoginScreen.passwordTextField".localized(),
                isSecure: true
            )
            Spacer()
            Button(action: {
                viewModel.login()
            }, label: {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(8)
                } else{
                    Text("LoginScreen.loginButton".localized())
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(8)}
            })
            .padding()
            if viewModel.error != "" {
                Text(viewModel.error)
                    .foregroundColor(.red)
                    .padding()
            }
        }
    }
}

#Preview {
    LoginScreen()
}
