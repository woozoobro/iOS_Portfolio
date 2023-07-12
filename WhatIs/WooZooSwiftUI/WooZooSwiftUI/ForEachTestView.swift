//
//  ForEachTestView.swift
//  WooZooSwiftUI
//
//  Created by 우주형 on 2023/07/12.
//

import SwiftUI

struct Fruit: Hashable {
    let name: String
    let count: Int
}

extension Fruit {
    static var lists: [Fruit] = [
        Fruit(name: "apple", count: 100),
        Fruit(name: "banana", count: 50),
        Fruit(name: "melon", count: 1),
        Fruit(name: "mandarin", count: 2),
    ]
}

struct ForEachTestView: View {
    let fruits = Fruit.lists
    
    var body: some View {
        VStack {
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit.name) + Text("\(fruit.count)개 있음")
            }
        }
    }
}

struct ForEachTestView_Previews: PreviewProvider {
    static var previews: some View {
        ForEachTestView()
    }
}
