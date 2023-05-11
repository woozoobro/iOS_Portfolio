//
//  Card.swift
//  CustomCarouselSlider
//
//  Created by 우주형 on 2023/05/11.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID().uuidString
    var cardColor: Color
    var offset: CGFloat = 0
    var title: String
}
