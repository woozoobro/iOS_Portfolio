//
//  TimerBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 우주형 on 2023/02/19.
//

import SwiftUI
/*

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 2.0, on: .main, in: .common).autoconnect()
    
    // Current Time
    /*
    @State var currentDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        //formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
     */
    
    // Countdown
    /*
    @State var count: Int = 10
    @State var finishedText: String? = nil
    */
    
    // Countdown to date
    /*
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureDate)
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(minute)m, \(second)s"
    }
     */
    
    // Animation counter
    @State var count: Int = 1
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [.purple, .blue]),
                center: .center,
                startRadius: 5,
                endRadius: 500)
            .ignoresSafeArea()
            
            TabView(selection: $count) {
                Rectangle()
                    .foregroundColor(.green)
                    .tag(1)
                Rectangle()
                    .foregroundColor(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundColor(.pink)
                    .tag(3)
                Rectangle()
                    .foregroundColor(.orange)
                    .tag(4)
            }
            .frame(height: 200)
            .tabViewStyle(.page)
        }
        .onReceive(timer) { _ in
            withAnimation(.default) {
                count = count == 4 ? 1 : count + 1
            }
        }
    }
}
*/

struct TimerBootcamp: View {
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    // CurrentTime
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
    @State var count: Int = 5
    @State var finishedText: String? = nil
    */
    
    // CountDown to date
    /*
    @State var timeRemaining: String = ""
    let futerDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futerDate)
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(minute) minutes, \(second) seconds"
    }
    */
    
    // Animation Counter
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [.purple, .blue]),
                center: .center, startRadius: 5, endRadius: 500)
            .ignoresSafeArea()
            
            HStack(spacing: 15) {
                Circle()
                    .offset(y: count == 1 ? -20 : 0)
                Circle()
                    .offset(y: count == 2 ? -20 : 0)
                Circle()
                    .offset(y: count == 3 ? -20 : 0)
            }
            .frame(width: 150)
            .foregroundColor(.white)
        }
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                count = count == 3 ? 0 : count + 1
            }

        }
    }
}

struct TimerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TimerBootcamp()
    }
}
