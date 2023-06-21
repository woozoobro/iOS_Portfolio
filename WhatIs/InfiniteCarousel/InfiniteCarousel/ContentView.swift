//
//  ContentView.swift
//  InfiniteCarousel
//
//  Created by 우주형 on 2023/06/20.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        //MARK: - NavigationStack일 때만 됨
        NavigationStack {
            Home()
                .navigationTitle("Infinite Carousel")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
