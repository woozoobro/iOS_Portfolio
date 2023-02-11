//
//  ContentView.swift
//  MyGumiTimer
//
//  Created by 우주형 on 2023/01/27.
//

import SwiftUI

struct CountTimeView: View {
    
    @ObservedObject var vm: CountTimeViewModel
    
    @State var timeCount = 0
    
    var body: some View {
        VStack(spacing: 30) {
            
//            ForEach(vm.timeList) { item in
//                HStack {
//                    Text(item.date.formatted())
//                    Text(item.timeLabel)
//                }
//            }
            
            Text(vm.timeModel.timeLabel)
                .onReceive(vm.timer) { _ in
                    if vm.timerRunning {
                        vm.currentTimePassed()
                    }
                }
            HStack {
                stopButton
                startButton
            }
        }
        .navigationTitle("GumiTimer")
    }
}

//MARK: - Components
extension CountTimeView {
    
    private var startButton: some View {
        Button {
            vm.startButtonPressed()
        } label: {
            Text(vm.timerRunning ? "Pause" : "Start" )
        }
    }
    
    private var stopButton: some View {
        Button {
            vm.stopButtonPressed()
        } label: {
            Text("Stop")
        }
    }
}

//MARK: - Previews
struct CountTimeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CountTimeView(vm: CountTimeViewModel())
        }
    }
}
