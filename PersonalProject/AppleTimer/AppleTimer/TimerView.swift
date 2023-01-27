//
//  TimerView.swift
//  AppleTimer
//
//  Created by 우주형 on 2023/01/15.
//

import SwiftUI

struct TimerView: View {
    @State var selectedTab = 3
    
    @EnvironmentObject var vm: TimerViewModel
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("세계시계")
                .tabItem {
                    Label("세계시계", systemImage: "network")
                }.tag(0)
            Text("알람")
                .tabItem {
                    Label("알람", systemImage: "alarm.fill")
                }.tag(1)
            Text("스톱워치")
                .tabItem {
                    Label("스톱워치", systemImage: "stopwatch.fill")
                }.tag(2)
            
            VStack {
                ZStack {                    
                    if vm.timerRunning {
                        TimerStartView()
                    } else {
                        timePicker
                    }
                }
                
                HStack {
                    cancelButton
                        
                    Spacer()
                    startButton
                }
                .padding()
                .padding(.horizontal)
                Spacer()
                Text("Time")
                    .font(.system(size: 100))
                Spacer()
            }
            .tabItem {
                Label("타이머", systemImage: "timer")
            }.tag(3)
        }
    }    
}

extension TimerView {
    private var startButton: some View {
        Button {
            vm.timerRunning = true
        } label: {
            ZStack {
                Circle()
                    .frame(width: 94, height: 94)
                    .foregroundColor(vm.timerRunning ? .orange.opacity(0.2) : .green.opacity(0.4))
                Circle()
                    .stroke(lineWidth: 2)
                    .frame(width: 86, height: 86)
                    .foregroundColor(.black)
                Circle()
                    .frame(width: 83, height: 83)
                    .foregroundColor(vm.timerRunning ? .orange.opacity(0.2) : .green.opacity(0.4))
                
                Text(vm.timerRunning ? "일시정지" : "시작")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.8))
            }
        }
    }
    private var cancelButton: some View {
        Button {
            vm.timerRunning = false
        } label: {
            ZStack {
                Circle()
                    .frame(width: 94, height: 94)
                    .foregroundColor(.gray)
                Circle()
                    .stroke(lineWidth: 2)
                    .frame(width: 86, height: 86)
                    .foregroundColor(.black)
                Circle()
                    .frame(width: 83, height: 83)
                    .foregroundColor(.gray)
                
                Text("취소")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.8))
            }
        }
    }
    
    private var timePicker: some View {
        GeometryReader { geometry in
            HStack(spacing: -5) {
                Spacer()
                Picker("Selected Hour", selection: $vm.selectedHour) {
                    ForEach(0..<24) { hour in
                        Text("\(hour)")
                            .tag(hour)
                    }
                }
                .frame(width: geometry.size.width/5, height: 200)
                Text("시간")
                
                Picker("Select Period", selection: $vm.selectedMinute) {
                    ForEach(0..<60) { minute in
                        Text("\(minute)")
                            .tag(minute)
                    }
                }
                .frame(width: geometry.size.width/4, height: 200)
                Text("분")
                
                Picker("Select Period", selection: $vm.selectedSecond) {
                    ForEach(0..<60) { second in
                        Text("\(second)")
                            .tag(second)
                    }
                }
                .frame(width: geometry.size.width/4, height: 200)
                Text("초")
                Spacer()
            }
            .pickerStyle(.wheel)
        }
        .frame(height: 300)
        .background()
    }
    
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(TimerViewModel())
            .preferredColorScheme(.dark)
    }
}
