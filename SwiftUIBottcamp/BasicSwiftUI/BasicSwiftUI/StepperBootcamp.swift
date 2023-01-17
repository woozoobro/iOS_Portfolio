//
//  StepperBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/17.
//

import SwiftUI

struct StepperBootcamp: View {
    @State var stepperValue: Int = 10
    @State var widthIncrement: CGFloat = 0
    var body: some View {
        VStack {
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
                .padding(50)
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 100 + widthIncrement, height: 100)
            
            Stepper("Stepper 2") {
                // increment
                incrementWidth(amount: 30)
            } onDecrement: {
                // decrement
                incrementWidth(amount: -30)
            }
        }
    }
    
    func incrementWidth(amount: CGFloat) {
        withAnimation(.easeInOut) {
            widthIncrement += amount
        }
    }
}

struct StepperBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StepperBootcamp()
    }
}
