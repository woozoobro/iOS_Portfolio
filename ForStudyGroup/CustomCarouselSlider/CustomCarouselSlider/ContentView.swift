//
//  ContentView.swift
//  CustomCarouselSlider
//
//  Created by 우주형 on 2023/05/11.
//

import SwiftUI

struct ContentView: View {
    @StateObject var homeModel = CarouselViewModel()
    
    var body: some View {
        Home()
        //Using it as Environment Object
            .environmentObject(homeModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
