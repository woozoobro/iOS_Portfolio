//
//  CoinImageView.swift
//  SwiftfulCrypto3
//
//  Created by 우주형 on 2023/03/12.
//

import SwiftUI

struct CoinImageView: View {
    @StateObject var vm: CoinImageViewModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: dev.coin)
    }
}
