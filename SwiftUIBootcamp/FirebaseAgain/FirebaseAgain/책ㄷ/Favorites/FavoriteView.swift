//
//  FavoriteView.swift
//  FirebaseAgain
//
//  Created by 우주형 on 2023/06/26.
//

import SwiftUI

@MainActor
final class FavoriteViewModel: ObservableObject {
    @Published private(set) var userFavoritedProducts: [UserFavoriteProduct] = []
    
    func getFavorites() {
        Task {
            let authResult = try AuthenticationManager.shared.getAuthenticatedUser()
            self.userFavoritedProducts = try await UserManager.shared.getAllUserFavoriteProduct(userId: authResult.uid)
        }
    }
    
    func removeFromFavorites(favoriteProductId: String) {
        Task {
            let authResult = try AuthenticationManager.shared.getAuthenticatedUser()
            try? await UserManager.shared.removeUserFavoriteProduct(userId: authResult.uid, favoriteProductId: favoriteProductId)
            getFavorites()
        }
    }
}

struct FavoriteView: View {
    @StateObject private var viewModel = FavoriteViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.userFavoritedProducts, id: \.id.self) { item in
                ProductCellViewBuilder(productId: String(item.productId))
                    .contextMenu {
                        Button("Remove from favorites") {
                            viewModel.removeFromFavorites(favoriteProductId: item.id)
                        }
                    }
            }
        }
        .navigationTitle("Favorites")
        .onAppear {
            viewModel.getFavorites()
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
