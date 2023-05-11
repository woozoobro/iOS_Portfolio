//
//  DragGestureView.swift
//  DiveUISample
//
//  Created by 우주형 on 2023/05/11.
//

import SwiftUI


struct DragGestureView: View {
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.6
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                
                ForEach(0..<4) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 10).fill(Color.blue)
                    }
                    .frame(width: 300 ,height: 500)
                }
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                currentDragOffsetY = value.translation.height
                            }
                        }
                        .onEnded { vlaue in
                            withAnimation(.spring()) {
                                if currentDragOffsetY < -150 {
                                    endingOffsetY = -startingOffsetY
                                } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                                    endingOffsetY = 0
                                }
                                currentDragOffsetY = 0
                            }
                        }
                )
                
            }
            
        }
    }
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 4
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
}




struct DragGestureView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DragGestureView()
        }
    }
}


/*
struct GeometryReaderView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 10) {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        
                        NavigationLink {
                            Text("hello")
                        } label: {
                            Image("dating_login")
                                .resizable().scaledToFit()
                                .frame(width: 300,height: 400)
                                .padding()
                                .background(Color.orange)
                                .cornerRadius(30)
                                .rotation3DEffect(Angle(degrees: getPercentage(geo: geometry) * 6), axis: (x: 0.0, y: -3, z: 0), anchor: .trailing, anchorZ: 100, perspective: 1)
                        }
                    }
                    .frame(height: 400)
                    
                }
            }
        }
    }
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.height / 2
        let currentY = geo.frame(in: .global).midY
        return Double(1 - (currentY / maxDistance))
    }
}
 */
