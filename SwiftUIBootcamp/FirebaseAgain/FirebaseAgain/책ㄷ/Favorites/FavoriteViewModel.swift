//
//  FavoriteViewModel.swift
//  FirebaseAgain
//
//  Created by 우주형 on 2023/06/28.
//

import Foundation
import Combine

@MainActor
final class FavoriteViewModel: ObservableObject {
    @Published private(set) var userFavoriteProducts: [UserFavoriteProduct] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    func addListenerForFavorites() {
        guard let authDataResult = try? AuthenticationManager.shared.getAuthenticatedUser() else { return }
//        UserManager.shared.addListenerForAllUserFavoriteProducts(userId: authDataResult.uid) { [weak self] products in
//            self?.userFavoriteProducts = products
//        }
        UserManager.shared.addListenerForAllUserFavoriteProducts(userId: authDataResult.uid)
            .sink { completion in
                
            } receiveValue: { [weak self] products in
                self?.userFavoriteProducts = products
            }
            .store(in: &cancellables)
    }
    
//    func getFavorites() {
//        Task {
//            let authResult = try AuthenticationManager.shared.getAuthenticatedUser()
//            self.userFavoriteProducts = try await UserManager.shared.getAllUserFavoriteProduct(userId: authResult.uid)
//        }
//    }
    
    func removeFromFavorites(favoriteProductId: String) {
        Task {
            let authResult = try AuthenticationManager.shared.getAuthenticatedUser()
            try? await UserManager.shared.removeUserFavoriteProduct(userId: authResult.uid, favoriteProductId: favoriteProductId)
        }
    }
}
