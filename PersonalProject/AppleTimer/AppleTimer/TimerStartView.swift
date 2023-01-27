//
//  TimerStartView.swift
//  AppleTimer
//
//  Created by 우주형 on 2023/01/28.
//

import SwiftUI

struct TimerStartView: View {
    
    @EnvironmentObject var vm: TimerViewModel
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(lineWidth: 12)
                .foregroundColor(.yellow)
            
            VStack(spacing: 20) {
                Text("\(vm.selectedHour):\(vm.selectedMinute):\(vm.selectedSecond)")
                    .font(.largeTitle)
                Label("00:00", systemImage: "bell.fill")
            }
        }
        .frame(height: 300)
//        .background(.blue)
    }
}

struct TimerStartView_Previews: PreviewProvider {
    static var previews: some View {
        TimerStartView()
            .environmentObject(TimerViewModel())
    }
}
