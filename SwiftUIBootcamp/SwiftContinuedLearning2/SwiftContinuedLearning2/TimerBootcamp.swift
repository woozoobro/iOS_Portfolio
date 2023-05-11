//
//  TimerBootcamp.swift
//  SwiftContinuedLearning2
//
//  Created by 우주형 on 2023/05/12.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    //Current Time
    /*
    @State var currentDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }
    */
    
    // CountDown
    /*
    @State var count: Int = 10
    @State var finishedText: String? = nil
    */
    
    // CountDown to date
    /*
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
//        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(minute):\(second)"
    }
    */
    
    // Animation counter
    @State var count: Int = 1
    
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.purple, Color.blue]), center: .center, startRadius: 5, endRadius: 500)
            .ignoresSafeArea()
            
            TabView(selection: $count) {
                Rectangle()
                    .foregroundColor(.red)
                    .tag(1)
                Rectangle()
                    .foregroundColor(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundColor(.green)
                    .tag(3)
                Rectangle()
                    .foregroundColor(.orange)
                    .tag(4)
                Rectangle()
                    .foregroundColor(.pink)
                    .tag(5)
            }
            .frame(height: 200)
            .tabViewStyle(.page)
        }
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                count = count == 5 ? 1 : count + 1
            }            
        }
    }
}

struct TimerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TimerBootcamp()
    }
}
