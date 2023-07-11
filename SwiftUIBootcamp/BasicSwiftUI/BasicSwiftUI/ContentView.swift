//
//  ContentView.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/07/11.
//

import SwiftUI

struct ContentView: View {
    let fruit: String
    
    var body: some View {
        VStack {
            Text(fruit)
            Spacer()
            SecondView()
        }
    }
}

struct SecondView: View {
    var body: some View {
        Circle()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruit: "사과")
    }
}
