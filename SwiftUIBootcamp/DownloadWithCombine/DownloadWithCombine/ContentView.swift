//
//  ContentView.swift
//  DownloadWithCombine
//
//  Created by 우주형 on 2023/02/19.
//

import SwiftUI
import Combine



struct DownloadWithCombine: View {
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
        DownloadWithCombine()
    }
}
