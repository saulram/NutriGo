//
//  LoginAction.swift
//  NutriGo
//
//  Created by Saul Ramirez on 11/06/24.
//

import Foundation

struct LoginAction {
    var params: LoginRequest
    var path: String = "/auth/login"
    
    func invoke(completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        var request = URLRequest(url: URL(string: "\(AppConstants.baseUrl)\(path)")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(params)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let response = try JSONDecoder().decode(LoginResponse.self, from: data!)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
