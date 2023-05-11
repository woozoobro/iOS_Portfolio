//
//  Expense.swift
//  DiveUISample
//
//  Created by 우주형 on 2023/05/11.
//

import SwiftUI

/// Expense Model
struct Expense: Identifiable, Equatable {
    var id = UUID().uuidString
    var amountSpent: String
    var product: String
    var productIcon: String
    var spendType: String
}

