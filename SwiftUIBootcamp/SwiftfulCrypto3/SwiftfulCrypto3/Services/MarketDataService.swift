//
//  MarketDataService.swift
//  SwiftfulCrypto3
//
//  Created by 우주형 on 2023/03/12.
//

import Foundation
import Combine

class MarketDataService {
    @Published var marketData: MarketDataModel? = nil
    
    private var marketDataSubscription : AnyCancellable?
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] returnedGlobaData in
                self?.marketData = returnedGlobaData.data
                self?.marketDataSubscription?.cancel()
            })
    }
    
    
    
}
