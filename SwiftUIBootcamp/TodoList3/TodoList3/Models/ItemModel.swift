//
//  ItemModel.swift
//  TodoList3
//
//  Created by 우주형 on 2023/02/12.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
//    func updateCompletion() -> ItemModel {
//        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
//    }
    
}
