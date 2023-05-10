//
//  ContentView.swift
//  DiveUISample
//
//  Created by 우주형 on 2023/05/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("dating_login")
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .frame(width: 310, height: 420)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
