//
//  InitializerBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/15.
//

import SwiftUI

struct InitializerBootcamp: View {
    
    let backgroundColor: Color
    let count: Int
    let title: String
  
    init(count: Int, fruit: Fruit) {
        self.count = count
        if fruit == .apple {
            self.title = "Apples"
            self.backgroundColor = .red
        } else {
            self.title = "Oranges"
            self.backgroundColor = .orange
        }
    }
    
    enum Fruit {
        case apple
        case orange
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(count)")
                .font(.largeTitle)
                .underline()
            
            Text(title)
                .font(.headline)
        }
        .foregroundColor(.white)
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

struct InitializerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            InitializerBootcamp(count: 100, fruit: .orange)
            InitializerBootcamp(count: 100, fruit: .apple)
        }
    }
}

