//
//  SliderBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/17.
//

import SwiftUI

//struct SliderBootcamp: View {
//
//    @State var sliderValue: Double = 3
//    @State var color: Color = .red
//    var body: some View {
//        VStack {
//            Text("Rating: \(String(format: "%.0f", sliderValue))")
//                .foregroundColor(color)
////            Slider(value: $sliderValue)
////            Slider(value: $sliderValue, in: 1...5)
////            Slider(value: $sliderValue, in: 1...5, step: 1.0)
//            Slider(value: $sliderValue, in: 1...5, step: 1.0,
//                   onEditingChanged: { _ in
//                color = .green
//            }, minimumValueLabel: Text("1"), maximumValueLabel: Text("5"),
//                   label: {
//                Text("Title")
//            })
//                .tint(.red)
//        }
//    }
//}

struct SliderBootcamp: View {
    
    @State var sliderValue: Double = 3
    @State var color: Color = .green
    
    var body: some View {
        VStack {
            Text("Rating:")
            Text(String(format: "%.0f", sliderValue))
                .foregroundColor(color)
//            Slider(value: $sliderValue)
//            Slider(value: $sliderValue, in: 1...5)
            Slider(value: $sliderValue, in: 1...5, step: 1.0)
                .tint(.red)
        }
    }    
}


struct SliderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SliderBootcamp()
    }
}
