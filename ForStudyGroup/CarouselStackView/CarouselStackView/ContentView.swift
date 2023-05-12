//
//  ContentView.swift
//  CarouselStackView
//
//  Created by 우주형 on 2023/05/12.
//

import SwiftUI



struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.white)
            .frame(height: 500)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var cardOffsets: [CGFloat] = [0, 50, 100, 150]
    @State private var cardScales: [CGFloat] = [1.0, 0.9, 0.8, 0.7]
    
    var body: some View {
        VStack {
            Spacer()
            ForEach(0..<cardOffsets.count, id: \.self) { index in
                CardView()
                    .offset(y: cardOffsets[index])
                    .scaleEffect(cardScales[index])
                    .animation(.spring())
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                self.cardOffsets[index] = max(0, value.translation.height)
                                updateScales()
                            }
                            .onEnded { value in
                                withAnimation {
                                    if value.predictedEndTranslation.height < -100 {
                                        moveCardToBack(at: index)
                                    } else {
                                        cardOffsets[index] = CGFloat(index) * 50
                                    }
                                    updateScales()
                                }
                            }
                    )
            }
            Spacer()
        }
    }
    
    private func moveCardToBack(at index: Int) {
        let newIndex = (index + 1) % cardOffsets.count
        cardOffsets[index] = CGFloat(newIndex) * 50
        cardOffsets.swapAt(index, newIndex)
    }
    
    private func updateScales() {
        for i in 0..<cardOffsets.count {
            let offset = cardOffsets[i]
            cardScales[i] = 1.0 - CGFloat(i) * 0.1 - offset / 500
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
