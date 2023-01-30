//
//  ContentView.swift
//  MyGumiTimer
//
//  Created by 우주형 on 2023/01/27.
//

import SwiftUI

struct CountTimeView: View {
    
    @StateObject private var vm = CountTimeViewModel()
    
    @State var timeCount = 0
    
    var body: some View {
        VStack {
            Text(vm.timeLabel)
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

struct CountTimeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CountTimeView()
        }
    }
}

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
