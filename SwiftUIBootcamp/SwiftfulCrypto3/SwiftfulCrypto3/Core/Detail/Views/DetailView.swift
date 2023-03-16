//
//  DetailView.swift
//  SwiftfulCrypto3
//
//  Created by 우주형 on 2023/03/16.
//

import SwiftUI

struct DetailLoadingView: View {
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}


struct DetailView: View {
    let coin: CoinModel

    init(coin: CoinModel) {
        self.coin = coin
        print("Initializing DetailView for \(coin.name)")
    }
    
    var body: some View {
        ZStack {
            Text(coin.name)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
