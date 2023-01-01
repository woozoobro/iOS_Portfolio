//
//  ContentView.swift
//  SwiftUI_Basic
//
//  Created by 우주형 on 2023/01/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                ImageView()
                TextView()
                ButtonView()
            }
            HStack {
                ImageView()
                TextView()
                ButtonView()
            }
            ZStack {
                ImageView()
                TextView()
                ButtonView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
