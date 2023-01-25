//
//  ItemModel.swift
//  MemoTwice
//
//  Created by 우주형 on 2023/01/25.
//

import Foundation

struct ItemModel: Identifiable {
    let id: UUID
    let title: String
    let isCompleted: Bool
    
    init(id: UUID = UUID(), title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
