//
//  ContentView.swift
//  DisneyLaunchScreenTest2
//
//  Created by 우주형 on 2023/03/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("BG")
                .ignoresSafeArea()
            
            Text("Hello Disney!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
