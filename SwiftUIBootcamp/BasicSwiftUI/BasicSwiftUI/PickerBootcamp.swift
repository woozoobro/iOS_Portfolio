//
//  PickerBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/17.
//

import SwiftUI

struct PickerBootcamp: View {
    
    @State var selection: String = "1"
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.red
    }
    
    var body: some View {
        
        Picker(selection: .constant(1)) {
            Text("1").tag(1)
            Text("2").tag(2)
        } label: {
            HStack {
                Text("Picker")
                Text(selection)
            }
            .font(.headline)
            .foregroundColor(.white)
            .background(.blue)
        }.pickerStyle(.segmented)

//        VStack {
//            HStack {
//                Text("Age: \(selection)")
//            }
//
//            Picker(selection: $selection) {
//                ForEach(18..<100) { number in
//                    Text("\(number)")
//                        .font(.largeTitle)
//                        .foregroundColor(.red)
//                        .tag("\(number)")
//                }
//            } label: {
//                Text("Picker")
//            }.pickerStyle(.wheel)
//                .background(.green.opacity(0.3))
//        }
    }
}

struct PickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PickerBootcamp()
    }
}
