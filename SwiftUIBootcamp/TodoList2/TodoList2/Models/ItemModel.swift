//
//  ItemModel.swift
//  TodoList2
//
//  Created by 우주형 on 2023/02/12.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
