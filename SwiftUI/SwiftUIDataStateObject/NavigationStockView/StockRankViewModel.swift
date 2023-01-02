//
//  StockRankViewModel.swift
//  NavigationStockView
//
//  Created by 우주형 on 2023/01/03.
//

import Foundation


final class StockRankViewModel: ObservableObject {
    @Published var models: [StockModel] = StockModel.list
    
    var numOfFavorites: Int {
        let favoriteStocks = models.filter { $0.isFavorite }
        return favoriteStocks.count
    }
}

