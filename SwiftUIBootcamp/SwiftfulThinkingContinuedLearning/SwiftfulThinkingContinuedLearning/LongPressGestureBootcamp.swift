//
//  LongPressGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 우주형 on 2023/01/21.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    @State var isComplete: Bool = false
    
    var body: some View {
        Text(isComplete ? "Completed" : "Not completed")
            .padding()
            .padding(.horizontal)
            .background(isComplete ? Color.green : Color.gray)
            .cornerRadius(10)
//            .onTapGesture {
//                isComplete.toggle()
//            }
            .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 1){
                isComplete.toggle()
            }
    }
}

struct LongPressGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureBootcamp()
    }
}
