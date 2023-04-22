//
//  ContentView.swift
//  WhatIsCombine
//
//  Created by 우주형 on 2023/04/22.
//

import SwiftUI

struct TimerView: View {
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State private var count: Int = 0
    @State var publishedDate: Date = Date()
    
    var body: some View {
        //Text("\(count)")
        Text(publishedDate.description)
            .font(.largeTitle)
            .onReceive(timer) { time in
                publishedDate = time
            }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
