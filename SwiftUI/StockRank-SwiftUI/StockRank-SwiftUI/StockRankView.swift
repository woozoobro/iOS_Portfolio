//
//  ContentView.swift
//  StockRank-SwiftUI
//
//  Created by 우주형 on 2023/01/02.
//

import SwiftUI

struct StockRankView: View {
    
    @State var list = StockModel.list
    
    var body: some View {
        
        List(list, id: \.self) { item in
            StockRankRow(stock: item)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
                .frame(height: 80)
        }
        .listStyle(.plain)
        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StockRankView()
    }
}
