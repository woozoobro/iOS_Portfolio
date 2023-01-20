//
//  ListRowView.swift
//  WhatTodoMemo
//
//  Created by 우주형 on 2023/01/20.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green: .pink)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 4)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var checkmark: ItemModel = ItemModel(title: "Hello", isCompleted: true)
    static var noCheckmark: ItemModel = ItemModel(title: "Omg", isCompleted: false)
    
    static var previews: some View {
        Group {
            ListRowView(item: checkmark)
            ListRowView(item: noCheckmark)
        }
    }
}
