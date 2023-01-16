//
//  TimerPickerView.swift
//  AppleTimer
//
//  Created by 우주형 on 2023/01/15.
//

import SwiftUI

struct TimerData: Hashable {
    let value: Int
    let unit: String
    var id: Int { value }
}


struct TimerPickerView: View {
    @State private var selectedHour: TimerData = TimerData(value: 0, unit: "시간")
    @State private var selectedMinute: TimerData = TimerData(value: 0, unit: "분")
    @State private var selectedSecond: TimerData = TimerData(value: 0, unit: "초")

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack(spacing: -5) {
                    Spacer()
                    Picker("Selected Hour", selection: $selectedHour) {
                        ForEach(0..<24, id: \.self) { hour in
                            Text("\(hour)")
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: geometry.size.width/5, height: 200)
                    .clipped()
                    Text("시간")
                    
                    Picker("Select Period", selection: $selectedMinute) {
                        ForEach(0..<60, id: \.self) { minute in
                            Text("\(minute)")
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: geometry.size.width/4, height: 200)
                    .clipped()
                    Text("분")
                    
                    
                    Picker("Select Period", selection: $selectedSecond) {
                        ForEach(0..<60, id: \.self) { minute in
                            Text("\(minute)")
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: geometry.size.width/4, height: 200)
                    
                    .clipped()
                    Text("초")
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerPickerView()
    }
}
