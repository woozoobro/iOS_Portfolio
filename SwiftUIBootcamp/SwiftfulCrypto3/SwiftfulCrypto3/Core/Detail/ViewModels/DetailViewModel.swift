//
//  DetailViewModel.swift
//  SwiftfulCrypto3
//
//  Created by 우주형 on 2023/03/16.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink { returnedCoinDetails in
                print("Recieved coin detail data")
                print(returnedCoinDetails)
            }
            .store(in: &cancellables)
    }
}
