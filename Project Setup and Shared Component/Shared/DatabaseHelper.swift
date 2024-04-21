//
//  DatabaseHelper.swift
//  Project Setup and Shared Component
//
//  Created by Saurabh  Verma on 13/04/24.
//

import Foundation

struct DatabaseHelper {
    func getProduct() async throws -> [Product]? {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badURL)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let product  = try JSONDecoder().decode(ProductArray.self, from: data)
            return product.products
        } catch let error {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
        
        
    func getUsers() async throws -> [User]? {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let users  = try JSONDecoder().decode(UsersArray.self, from: data)
            return users.users
        } catch let error {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}
