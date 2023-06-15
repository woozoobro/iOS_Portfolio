//
//  GroupBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/06/10.
//

import SwiftUI

struct GroupBootcamp: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("Hello, world!")
            
            Group {
                Text("Hello, world!")
                Text("Hello, world!")
            }
            .foregroundColor(.blue)
        }
        .foregroundColor(.red)
    }
}

struct GroupBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GroupBootcamp()
    }
}
