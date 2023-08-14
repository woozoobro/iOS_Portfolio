//
//  ContentView.swift
//  CacheImage_tunsdev
//
//  Created by 우주형 on 2023/08/06.
//

import SwiftUI

struct ContentView: View {
    let urlString = "https://github.com/xavier7t/iOSDevX/blob/main/iOSDevX/Assets.xcassets/demo.imageset/demo.png?raw=true"
    var body: some View {
        VStack {
            CustomWebImage()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
