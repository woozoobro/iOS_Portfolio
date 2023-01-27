//
//  TimerPickerView.swift
//  AppleTimer
//
//  Created by 우주형 on 2023/01/15.
//

import SwiftUI

struct TimerPickerView: View {
    @State var selectedTab = 3
    
    @State private var selectedHour = TimeData(value: 0, unit: "시간")
    @State private var selectedMinute = TimeData(value: 0, unit: "분")
    @State private var selectedSecond = TimeData(value: 0, unit: "초")
    
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
                TimePicker(hour: $selectedHour, minute: $selectedMinute, second: $selectedSecond)
                
                HStack {
                    CtaButton(title: "취소", buttonColor: .gray)
                        
                    Spacer()
                    CtaButton(title: "시작", buttonColor: .green)
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

struct CtaButton: View {
    @State var title: String
    @State var buttonColor: Color
    
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                Circle()
                    .frame(width: 94, height: 94)
                    .foregroundColor(buttonColor)
                Circle()
                    .stroke(lineWidth: 2)
                    .frame(width: 86, height: 86)
                    .foregroundColor(.black)
                Circle()
                    .frame(width: 83, height: 83)
                    .foregroundColor(buttonColor)
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.8))
            }
        }
    }
}

struct TimePicker: View {
    @Binding var hour: TimeData
    @Binding var minute: TimeData
    @Binding var second: TimeData
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: -5) {
                Spacer()
                Picker("Selected Hour", selection: $hour) {
                    ForEach(0..<24, id: \.self) { hour in
                        Text("\(hour)")
                    }
                }
                .frame(width: geometry.size.width/5, height: 200)
                Text("시간")
                
                Picker("Select Period", selection: $minute) {
                    ForEach(0..<60, id: \.self) { minute in
                        Text("\(minute)")
                    }
                }
                .frame(width: geometry.size.width/4, height: 200)
                Text("분")
                
                Picker("Select Period", selection: $second) {
                    ForEach(0..<60, id: \.self) { minute in
                        Text("\(minute)")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerPickerView()
            .preferredColorScheme(.dark)
    }
}
