//
//  LoginResponse.swift
//  NutriGo
//
//  Created by Saul Ramirez on 11/06/24.
//

import Foundation

import Foundation

struct LoginResponse: Decodable {
    let user: User
    let token: String
}

struct User: Decodable {
    let historicalDiets: [String]
    let id: String
    let name: String
    let surname: String
    let email: String
    let password: String
    let role: String
    let avatar: String
    let patientsList: [String]
    let createdAt: String
    let updatedAt: String

    private enum CodingKeys: String, CodingKey {
        case historicalDiets
        case id = "_id"
        case name
        case surname
        case email
        case password
        case role
        case avatar
        case patientsList
        case createdAt
        case updatedAt
    }
}
