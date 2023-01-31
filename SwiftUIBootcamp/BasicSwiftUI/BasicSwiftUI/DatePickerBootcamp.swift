//
//  DatePickerBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/17.
//

import SwiftUI

//struct DatePickerBootcamp: View {
//
//    @State var selectedDate: Date = Date()
//    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
//    let endingDate: Date = Date()
//
//    var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .short
//        formatter.timeStyle = .short
//        return formatter
//    }
//
//    var body: some View {
//        VStack {
//            Text("Selected Date is")
//            Text(dateFormatter.string(from: selectedDate))
//
//            DatePicker("Select a date", selection: $selectedDate, in: startingDate...endingDate)
//        }
//    }
//}

struct DatePickerBootcamp: View {
    
    @State var selectedDate: Date = Date()
    
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2023)) ?? Date()
    let endingDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("Selected Date is:")
            Text(dateFormatter.string(from: selectedDate))
                .font(.title)
            DatePicker("Select a Date", selection: $selectedDate, in: startingDate...endingDate)
        }
        
        
            //.tint(.red)
            //.datePickerStyle(.graphical)
            //.datePickerStyle(.wheel)
    }
}

struct DatePickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerBootcamp()
    }
}
