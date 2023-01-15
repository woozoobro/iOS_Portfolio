//
//  TimerPickerView.swift
//  AppleTimer
//
//  Created by 우주형 on 2023/01/15.
//

import SwiftUI

struct TimerPickerView: View {
    @State private var hours = 0
        @State private var minutes = 0
        @State private var seconds = 0
        var body: some View {
            HStack {
                Picker("Hours", selection: $hours) {
                    ForEach(0..<24) {
                        Text("\($0)").tag($0)
                    }
                }
//                .pickerStyle(WheelPickerStyle())
                .frame(width: 100, height: 100)
                .clipped()
                
                Text(":")
                .font(.system(size: 40))
                
                Picker("Minutes", selection: $minutes) {
                    ForEach(0..<60) {
                        Text("\($0)").tag($0)
                    }
                }
//                .pickerStyle(WheelPickerStyle())
                .frame(width: 100, height: 100)
                .clipped()
                
                Text(":")
                .font(.system(size: 40))
                
                Picker("Seconds", selection: $seconds) {
                    ForEach(0..<60) {
                        Text("\($0)").tag($0)
                    }
                }
//                .pickerStyle(WheelPickerStyle())
                .frame(width: 100, height: 100)
                .clipped()
            }.pickerStyle(.wheel)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerPickerView()
    }
}
