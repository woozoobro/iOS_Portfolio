//
//  ProductCellViewBuilder.swift
//  FirebaseAgain
//
//  Created by 우주형 on 2023/06/27.
//

import SwiftUI

struct ProductCellViewBuilder: View {
    
    let productId: String
    @State private var product: Product? = nil
    
    var body: some View {
        ZStack {
            if let product {
                ProductCellView(product: product)
            }
        }
        .task {
            self.product = try? await ProductsManager.shared.getProduct(productId: productId)
        }
    }
}

struct ProductCellViewBuilder_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellViewBuilder(productId: "1")
    }
}
