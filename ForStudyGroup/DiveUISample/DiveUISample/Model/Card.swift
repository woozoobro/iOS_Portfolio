//
//  Card.swift
//  DiveUISample
//
//  Created by 우주형 on 2023/05/11.
//

import SwiftUI

struct Card: Identifiable, Equatable {
    var id = UUID()
    var cardName: String
    var cardColor: Color
    var cardBalance: String
    var isFirstBlankCard: Bool = false
    var expenses: [Expense] = []
}

/// Sample Cards
var sampleCards: [Card] = [
    .init(cardName: "", cardColor: .clear, cardBalance: "", isFirstBlankCard: true),
    .init(cardName: "iJustine", cardColor: Color.green, cardBalance: "$1024.9", expenses: [
        Expense(amountSpent: "$18", product: "Youtube", productIcon: "Youtube", spendType: "Streaming"),
        Expense(amountSpent: "$128", product: "Amazon", productIcon: "Amazon", spendType: "Groceries"),
        Expense(amountSpent: "$28", product: "Apple", productIcon: "Apple", spendType: "Apple Pay"),
    ]),
    
    .init(cardName: "iJustine", cardColor: Color.orange, cardBalance: "$2439.5", expenses: [
        Expense(amountSpent: "$9", product: "Patreon", productIcon: "Patreon", spendType: "Membership"),
        Expense(amountSpent: "$10", product: "Dribble", productIcon: "Dribble", spendType: "Membership"),
        Expense(amountSpent: "$99", product: "Instagram", productIcon: "Instagram", spendType: "Ad Publish"),
    ]),
    
    .init(cardName: "iJustine", cardColor: Color.orange, cardBalance: "$2439.5", expenses: [
        Expense(amountSpent: "$55", product: "Netflix", productIcon: "Netflix", spendType: "Movies"),
        Expense(amountSpent: "$348", product: "Photoshop", productIcon: "Photoshop", spendType: "Editing"),
        Expense(amountSpent: "$99", product: "Figma", productIcon: "Figma", spendType: "Pro Member"),
    ]),
    
    
]
