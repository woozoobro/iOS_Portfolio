//
//  DragGestureView.swift
//  HappySunday
//
//  Created by 우주형 on 2023/03/26.
//

import SwiftUI

struct LongPressGestureView: View {
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    @State var animate: Bool = false
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                Rectangle()
                    .fill(isSuccess ? Color.green : Color.blue)
                    .frame(maxWidth: isComplete ? .infinity : 0)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.gray)
                
                HStack {
                    Text(animate ? "당첨!" : "눌러주세요")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                        .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
                            
                            withAnimation(.easeInOut) {
                                isSuccess.toggle()
                                animate.toggle()
                            }
                        } onPressingChanged: { isPressing in
                            if isPressing {
                                withAnimation(.easeInOut(duration: 1.0)) {
                                    isComplete = true
                                }
                            } else {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    if !isSuccess {
                                        withAnimation(.easeInOut) {
                                            isComplete = false
                                        }
                                    }
                                }
                            }
                        }
                    
                    Text("Reset")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                        .onTapGesture {
                            isComplete = false
                            isSuccess = false
                            animate = false
                        }
                }
            }
            
            if animate {
                LottiePlusView(name: "confetti")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .allowsHitTesting(false)
            }
        }
    }
}

struct LongPressGestureView_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureView()
    }
}
    
