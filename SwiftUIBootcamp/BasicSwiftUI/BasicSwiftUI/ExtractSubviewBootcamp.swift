//
//  ExtractSubviewBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/16.
//

import SwiftUI

struct MyItem: View {
    let title: String
    let count: Int
    let color: Color
    var body: some View {
        VStack {
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}

struct ExtractSubviewBootcamp: View {
    var body: some View {
        ZStack {
            Color(.systemTeal).ignoresSafeArea()
            
           contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack {
            MyItem(title: "Apples", count: 1, color: .red)
            MyItem(title: "Oranges", count: 10, color: .orange)
            MyItem(title: "Bananas", count: 34, color: .yellow)
        }
    }
}

struct ExtractSubviewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSubviewBootcamp()
    }
}
