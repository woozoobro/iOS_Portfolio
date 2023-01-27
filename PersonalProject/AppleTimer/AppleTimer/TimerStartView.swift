//
//  TimerStartView.swift
//  AppleTimer
//
//  Created by 우주형 on 2023/01/28.
//

import SwiftUI

struct TimerStartView: View {
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timerRunning = false
    
    var body: some View {
        VStack {
            Text("Hello, World!")            
            
            Label("Hello", systemImage: "xmark")
        }
    }
}

struct TimerStartView_Previews: PreviewProvider {
    static var previews: some View {
        TimerStartView()
    }
}
