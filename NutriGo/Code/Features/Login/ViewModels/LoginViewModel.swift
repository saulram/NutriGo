//
//  LoginViewModel.swift
//  NutriGo
//
//  Created by Saul Ramirez on 11/06/24.
//

import Foundation
import SwiftUI

@MainActor
class LoginViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""
    @Published var isLogged = false
    @Published var error = ""
    @Published var isLoading = false
    @Published var response: LoginResponse?

    func login() {
        self.isLoading = true
        
        LoginAction(params: LoginRequest(email: email, password: password)).invoke { result in
            
            switch result {
            case .success:
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        self.isLoading = false
                        self.isLogged = true
                        //update response
                        self.response = try? result.get()
                        
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.error = error.localizedDescription
                }
            }
        }
    }
    func logout() {
        self.isLogged = false
    }
}
