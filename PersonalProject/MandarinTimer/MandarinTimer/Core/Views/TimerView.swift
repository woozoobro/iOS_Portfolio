//
//  TimerView.swift
//  MandarinTimer
//
//  Created by 우주형 on 2023/02/25.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var vm: TimerViewModel
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            Text(vm.countToTimeLabel())
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            List {
                ForEach(vm.timeList) { time in
                    Text(time.passedTime)
                }
            }
            
            Spacer()
            allButtons
            Spacer()
            Spacer()
        }
        .navigationTitle("타이머")
    }
}

extension TimerView {
    private var allButtons: some View {
        HStack {
            Button {
                vm.startButtonPressed()
            } label: {
                Image(systemName: vm.isStarting ? "pause" : "play")
                Text(vm.isStarting ? "일시정지" : "시작")
            }
            .font(.title)
            .fontWeight(.semibold)
            .tint(Color.white)
            .frame(height: 55)
            .padding(.horizontal)
            .background(Color.blue.cornerRadius(20))
            
            Button {
                vm.stopButtonPressed()
            } label: {
                Image(systemName: "stop")
                Text("종료")
            }
            .font(.title)
            .fontWeight(.semibold)
            .tint(Color.white)
            .frame(height: 55)
            .padding(.horizontal)
            .background(Color.purple.cornerRadius(20))
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimerView()
                .environmentObject(TimerViewModel())
        }
    }
}
