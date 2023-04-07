//
//  ProductsView.swift
//  SwiftfulFirebase
//
//  Created by 우주형 on 2023/04/07.
//

import SwiftUI

@MainActor
final class ProductsViewModel: ObservableObject {
    
    
    func downloadProductsAndUploadToFirebase() {
        // https://dummyjson.com/products
        guard let url = URL(string: "https://dummyjson.com/products") else { return }
        
        Task {
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                let products = try JSONDecoder().decode(ProductArray.self, from: data)
                
                print("SUCCESS")
                print(products.products.count)
            } catch {
                print(error)
            }
        }
    }
}

struct ProductsView: View {
    @StateObject private var viewModel = ProductsViewModel()
    
    var body: some View {
        ZStack {
            Text("Hello, World!")
        }
        .navigationTitle("Products")
        .onAppear {
            viewModel.downloadProductsAndUploadToFirebase()
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductsView()
        }
    }
}
