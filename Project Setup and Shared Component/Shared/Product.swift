//
//  Product.swift
//  Project Setup and Shared Component
//
//  Created by Saurabh  Verma on 13/04/24.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]?
    let total, skip, limit: Int?
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int?
    let title, description: String?
    let price: Int?
    let discountPercentage, rating: Double?
    let stock: Int?
    let brand, category: String?
    let thumbnail: String?
    let images: [String]?
    
    var firstImage: String {
        return images?.first ?? Constants.randomImage
    }
    
    static var mockProduct: Product {
        Product(
            id: 123,
            title: "Example Product Title",
            description: "This is some mock product description goes here.",
            price: 999,
            discountPercentage: 15,
            rating: 4.5,
            stock: 50,
            brand: "Apple",
            category: "Electronic Devices",
            thumbnail: Constants.randomImage,
            images: [
                Constants.randomImage,
                Constants.randomImage,
                Constants.randomImage
            ]
        )
    }
}

struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String?
    let product: [Product]?
}
