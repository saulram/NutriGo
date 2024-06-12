//
//  NutriGoApp.swift
//  NutriGo
//
//  Created by Saul Ramirez on 11/06/24.
//

import SwiftUI
import SwiftData

@main
struct NutriGoApp: App {
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ApplicationSwitcher()
            }
            .environmentObject(loginViewModel)
        }
    }
}

struct ApplicationSwitcher: View {
    @EnvironmentObject var viewModel: LoginViewModel
    
    var body: some View {
        if viewModel.isLogged {
            HomeView()
        } else {
            LoginScreen()
        }
    }
}

#Preview {
    ApplicationSwitcher()
        .environmentObject(LoginViewModel())
}
