//
//  ContentView.swift
//  AppleTimer2
//
//  Created by 우주형 on 2023/01/27.
//

import SwiftUI

struct ContentView: View {
    @State var selectedHour: String = "0"
    @State var selectedMinute: String = "0"
    
    let hourRange = [Int](0...23)
    let minuteRange = [Int](0...59)
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Time: ")
            }
            
            
            HStack {
                Picker("HourSelect", selection: $selectedHour) {
                    ForEach(hourRange, id: \.self) { hour in
                        Text("\(hour)")
                            .tag("\(hour)")
                    }
                }
                
                Picker("MinuteSelect", selection: $selectedMinute) {
                    ForEach(minuteRange, id: \.self) { minute in
                        Text("\(minute)")
                            .tag("\(minute)")
                    }
                }
                
                
            }
            .pickerStyle(.wheel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
