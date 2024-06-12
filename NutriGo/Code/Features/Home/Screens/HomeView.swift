//
//  HomeView.swift
//  NutriGo
//
//  Created by Saul Ramirez on 11/06/24.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var loginViewModel: LoginViewModel
    var body: some View {
        VStack {
            Text("HelloWorld".localized(arguments: loginViewModel.response?.user.name ?? "No Data"))
            Spacer()
            Button(action: {
                loginViewModel.logout()
            }, label: {
                Text("HomeScreen.logout".localized())
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.red)
                    .cornerRadius(8)
            })
        }
    }
}

#Preview {
    HomeView()
}
