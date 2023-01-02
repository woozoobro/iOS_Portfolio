//
//  ContentView.swift
//  StockRank-SwiftUI
//
//  Created by 우주형 on 2023/01/02.
//

import SwiftUI

struct StockRankView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StockRankView()
    }
}
