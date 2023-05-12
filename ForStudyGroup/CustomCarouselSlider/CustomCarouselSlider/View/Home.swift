//
//  Home.swift
//  CustomCarouselSlider
//
//  Created by 우주형 on 2023/05/11.
//

import SwiftUI

// width
var height = UIScreen.main.bounds.height

struct Home: View {
    @EnvironmentObject var model: CarouselViewModel
    @Namespace var animation
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    
                    Text("Health Tips")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.leading)
                    Spacer()
                }
                .padding()
                
                // Carousel
                ZStack {
                    ForEach(model.cards.indices.reversed(), id: \.self) { index in
                        VStack {
                            CardView(card: model.cards[index], animation: animation)
                                .frame(width: getCardWidth(index: index), height: getCardHeight(index: index))
                                .offset(y: getCardOffset(index: index) + model.cards[index].offset)
                                //.rotationEffect(.init(degrees: getCardRotation(index: index)))
                            Spacer(minLength: 0)
                        }
                        .frame(height: 400)
                        .contentShape(Rectangle())
                        .offset(y: model.cards[index].offset)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in
                                    onChanged(value: value, index: index)
                                }
                                .onEnded { value in
                                    onEnd(value: value, index: index)
                                }
                        )
                    }
                }
                .padding(.top, 25)
                .padding(.horizontal, 30)
                
                Button {
                    resetView()
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title).fontWeight(.semibold)
                        .padding()
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                }
                .padding(.top, 35)
                
                Spacer()
            }
            
            // Detail View
            if model.showCard {
                DetailView(animation: animation)
            }
        }
    }
    
    // Resting Views..
    func resetView() {
        for index in model.cards.indices {
            withAnimation(.spring()) {
                model.cards[index].offset = 0
                model.swipedCard = 0
            }
        }
    }
    
    func onChanged(value: DragGesture.Value, index: Int) {
        // Only Left Swipe
        if value.translation.height < 0 {
            model.cards[index].offset = value.translation.height
        }
        
    }
    
    func onEnd(value: DragGesture.Value, index: Int) {
        withAnimation(.spring()) {
            if -value.translation.height > height / 10 {
                model.cards[index].offset = -height
                model.swipedCard += 1
            } else if value.translation.height > height / 10 {
                // Bring back the previous card if swiped card is greater than 0
                if model.swipedCard > 0 {
                    model.swipedCard -= 1
                    model.cards[model.swipedCard].offset = 0
                }
            } else {
                model.cards[index].offset = 0
            }
        }
    }
    
    // Getting Rotation When Card is being Swiped...
//    func getCardRotation(index: Int) -> Double {
//        let boxWidth = Double(height / 3)
//        let offset = Double(model.cards[index].offset)
//        let angle: Double = 4
//
//        return (offset / boxWidth) * angle
//    }
    
    // Getting Width And Height For Card...
    func getCardHeight(index: Int) -> CGFloat {
        let height: CGFloat = 400
        // Again First Three Card
        let cardHeight = index - model.swipedCard <= 2 ? CGFloat(index - model.swipedCard) * 35 : 70
        return height - cardHeight
    }
    
    func getCardWidth(index: Int) -> CGFloat {
        let boxWidth = UIScreen.main.bounds.width - 60 - 60
        // For First Three Cards...
        //let cardWith = index <= 2 ? CGFloat(index) * 30 : 60
        return boxWidth
    }
    
    // Getting Offset...
    func getCardOffset(index: Int) -> CGFloat {
        return CGFloat(index - model.swipedCard) * 30
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
