//
//  ListView.swift
//  TodoList2
//
//  Created by 우주형 on 2023/02/12.
//

import SwiftUI

struct ListView: View {
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first", isCompleted: false),
        ItemModel(title: "This is the second", isCompleted: true),
        ItemModel(title: "Third", isCompleted: false),
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(.plain)
        .navigationTitle("메모메모📝")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add")
                }

            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}

