//
//  ProductsDatabase.swift
//  SwiftfulFirebase
//
//  Created by 우주형 on 2023/04/07.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Identifiable, Codable {
    let id: Int
    let title: String?
    let description: String?
    let price: Int?
    let dicountPercentage: Double?
    let rating: Double?
    let stock: Int?
    let brand, category: String?
    let thumbnail: String?
    let images: [String]?
}
