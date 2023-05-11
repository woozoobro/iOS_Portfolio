//
//  CarouselViewModel.swift
//  CustomCarouselSlider
//
//  Created by 우주형 on 2023/05/11.
//

import SwiftUI

class CarouselViewModel: ObservableObject {
    
    @Published var cards = [
        Card(cardColor: Color.blue, title: "Neurobics for your mind."),
        Card(cardColor: Color.purple, title: "Brush up on hygine."),
        Card(cardColor: Color.green, title: "Don't skip breakfast."),
        Card(cardColor: Color.yellow, title: "Brush up on hygine"),
        Card(cardColor: Color.orange, title: "Neurobics for your mind."),
    ]
    
    @Published var swipedCard = 0
    
    @Published var showCard = false
    @Published var selectedCard = Card(cardColor: .clear, title: "")
    var content = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
}
