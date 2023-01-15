//
//  TimerPickerView.swift
//  AppleTimer
//
//  Created by 우주형 on 2023/01/15.
//

import SwiftUI
import UIKit
struct Time {
    var hour: Int = 0
    var minute: Int = 0
    var second: Int = 0
}

struct TimerPickerView: UIViewRepresentable {
    
     var time: Time

        func makeCoordinator() -> TimerPickerView.Coordinator {
            Coordinator(self)
        }

        func makeUIView(context: Context) -> UIDatePicker {
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = .countDownTimer
            datePicker.addTarget(context.coordinator, action: #selector(Coordinator.onDateChanged), for: .valueChanged)
            return datePicker
        }

        func updateUIView(_ datePicker: UIDatePicker, context: Context) {
            let date = Calendar.current.date(bySettingHour: time.hour, minute: time.minute, second: time.second, of: datePicker.date)!
            datePicker.setDate(date, animated: true)
        }

        class Coordinator: NSObject {
            var durationPicker: TimerPickerView

            init(_ durationPicker: TimerPickerView) {
                self.durationPicker = durationPicker
            }

            @objc func onDateChanged(sender: UIDatePicker) {
                print(sender.date)
                let calendar = Calendar.current
                let date = sender.date
                durationPicker.time = Time(hour: calendar.component(.hour, from: date), minute: calendar.component(.minute, from: date), second: calendar.component(.second, from: date))
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerPickerView(time: Time(hour: 0, minute: 0, second: 0))
    }
}
