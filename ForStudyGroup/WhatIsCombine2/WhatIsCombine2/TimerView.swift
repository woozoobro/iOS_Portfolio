//
//  TimerView.swift
//  WhatIsCombine2
//
//  Created by 우주형 on 2023/04/22.
//

import SwiftUI
import Combine

struct TimerView: View {
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    @State var publishedDate: Date = Date()
    
    var body: some View {
        Text(publishedDate.description)
            .font(.title)
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
