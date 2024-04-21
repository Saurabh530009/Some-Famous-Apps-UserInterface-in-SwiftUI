//
//  Users.swift
//  Project Setup and Shared Component
//
//  Created by Saurabh  Verma on 13/04/24.
//

import Foundation

// MARK: - Welcome
struct UsersArray: Codable {
    let users: [User]?
    let total, skip, limit: Int?
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int?
    let firstName, lastName, maidenName: String?
    let age: Int?
    let gender: String?
    let email, phone, username, password: String?
    let birthDate: String?
    let image: String?
    let bloodGroup: String?
    let height: Int?
    
    static var mockUser: User {
        User(
            id: 444,
            firstName: "Saurabh",
            lastName: "Verma",
            maidenName: nil,
            age: 24,
            gender: "M",
            email: nil,
            phone: nil,
            username: nil,
            password: nil,
            birthDate: nil,
            image: Constants.randomImage,
            bloodGroup: nil,
            height: 155
        )
    }
}
