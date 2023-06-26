//
//  ProductsView.swift
//  FirebaseAgain
//
//  Created by 우주형 on 2023/06/24.
//

import SwiftUI
import FirebaseFirestore

@MainActor
final class ProductsViewModel: ObservableObject {
    private var lastDocument: DocumentSnapshot? = nil
    
    @Published private(set) var products: [Product] = []
    @Published var selectedFilter: FilterOption? = nil
    @Published var selectedCategory: CategoryOption? = nil
    
    enum FilterOption: String, CaseIterable {
        case noFilter
        case priceHigh
        case priceLow
        
        var priceDescending: Bool? {
            switch self {
                case .noFilter: return nil
                case .priceHigh: return true
                case .priceLow: return false
            }
        }
    }
    
    enum CategoryOption: String, CaseIterable {
        case noCategory
        case smartphones
        case laptops
        case fragrances
        
        var categoryKey: String? {
            if self == .noCategory {
                return nil
            }
            return self.rawValue
        }
    }
    
    func filterSelected(option: FilterOption) async throws {
        self.selectedFilter = option
        self.products = []
        self.lastDocument = nil
        self.getProducts()
    }
    
    func categorySelected(option: CategoryOption) async throws {
        self.selectedCategory = option
        self.products = []
        self.lastDocument = nil
        self.getProducts()
    }
    
    func getProducts() {
        Task {
            let (newProducts, lastDocument) = try await ProductsManager.shared.getAllProducts(priceDescending: selectedFilter?.priceDescending, forCategory: selectedCategory?.categoryKey, count: 10, lastDocument: self.lastDocument)
            self.products.append(contentsOf: newProducts)
            
            if let lastDocument {
                self.lastDocument = lastDocument
            }
        }
    }
    
    func addUserFavoriteProduct(productId: Int) {
        Task {
            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
            try? await UserManager.shared.addUserFavoriteProduct(userId: authDataResult.uid, productId: productId)
        }
    }
    
//    func getProductsCount() {
//        Task {
//            let count = try await ProductsManager.shared.getAllProductsCount()
//            print("All Product Count: \(count)")
//        }
//    }
    
//    func getProductsByRating() {
//        Task {
////            let newProducts = try await ProductsManager.shared.getProductsByRating(count: 3, lastRating: self.products.last?.rating)
//            let (newProducts, lastDocument) = try await ProductsManager.shared.getProductsByRating(count: 3, lastDocument: self.lastDocument)
//            self.products.append(contentsOf: newProducts)
//            self.lastDocument = lastDocument
//        }
//    }
    
}

struct ProductsView: View {
    @StateObject private var viewModel = ProductsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.products) { product in
                ProductCellView(product: product)
                    .contextMenu {
                        Button("Add to favorites") {
                            viewModel.addUserFavoriteProduct(productId: product.id)
                        }
                    }
                
                if product == viewModel.products.last {
                    ProgressView()
                        .onAppear {
                            viewModel.getProducts()
                        }
                }
            }
        }
        .navigationTitle("Products")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Menu("Filter: \(viewModel.selectedFilter?.rawValue ?? "NONE")") {
                    ForEach(ProductsViewModel.FilterOption.allCases, id: \.self) { option in
                        Button(option.rawValue) {
                            Task {
                                try? await viewModel.filterSelected(option: option)
                            }
                        }
                    }
                }
                     
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu("Category: \(viewModel.selectedCategory?.rawValue ?? "NONE")") {
                    ForEach(ProductsViewModel.CategoryOption.allCases, id: \.self) { option in
                        Button(option.rawValue) {
                            Task {
                                try? await viewModel.categorySelected(option:option)
                            }
                        }
                    }
                }
            }
        }
        .onAppear() {
            viewModel.getProducts()
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












