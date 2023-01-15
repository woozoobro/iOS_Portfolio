//
//  SpacerBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/15.
//

import SwiftUI

struct SpacerBootcamp: View {
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 100, height: 100)
            
            Spacer()
                .frame(height: 10)
                .background(.orange)
            
            Rectangle()
                .frame(width: 100, height: 100)
        }
        .background(.blue)
    }
}

struct SpacerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SpacerBootcamp()
    }
}
