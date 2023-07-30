//
//  WhatIsState.swift
//  WooZooSwiftUI
//
//  Created by 우주형 on 2023/07/17.
//

import SwiftUI

struct WhatIsState: View {
    @State private var backgroundColor: Color = .green
    @State private var title: String = ""
    @State private var count: Int = 0
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text(title)
                    .font(.title)
                Text("Count: \(count)")
                    .font(.headline)
                    .underline()
                HStack(spacing: 20) {
                    Button("Button 1") {
                        backgroundColor = .purple
                        title = "Button 1 was Pressed"
                        count += 1
                    }
                    
                    Button("Button 2") {
                        backgroundColor = .gray
                        title = "Button 2 was Pressed"
                        count -= 1
                    }
                }
            }
        }
    }
}

struct WhatIsState_Previews: PreviewProvider {
    static var previews: some View {
        WhatIsState()
    }
}
