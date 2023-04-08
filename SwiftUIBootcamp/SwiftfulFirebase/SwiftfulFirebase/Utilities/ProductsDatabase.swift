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
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case price
        case dicountPercentage
        case rating
        case stock
        case brand
        case category
        case thumbnail
        case images
    }
}

//    func downloadProductsAndUploadToFirebase() {
//        // https://dummyjson.com/products
//        guard let url = URL(string: "https://dummyjson.com/products") else { return }
//
//        Task {
//            do {
//                let (data, _) = try await URLSession.shared.data(from: url)
//                let products = try JSONDecoder().decode(ProductArray.self, from: data)
//                let productArray = products.products
//
//                for product in productArray {
//                    try? await ProductsManager.shared.uploadProduct(product: product)
//                }
//
//                print("SUCCESS")
//                print(products.products.count)
//            } catch {
//                print(error)
//            }
//        }
//    }
