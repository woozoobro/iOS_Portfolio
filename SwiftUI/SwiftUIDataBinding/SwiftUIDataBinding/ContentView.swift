//
//  ContentView.swift
//  SwiftUIDataBinding
//
//  Created by 우주형 on 2023/01/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PlayerView(episode: Episode.list[0])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
