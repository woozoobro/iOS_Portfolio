//
//  ImageBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/14.
//

import SwiftUI

struct ImageBootcamp: View {
    var body: some View {
        Image("WooJu")
            .resizable()
//            .aspectRatio(contentMode: .fit)
            .scaledToFill()
            .frame(width: 300, height: 300)
//            .clipped()
//            .cornerRadius(150)
            .clipShape(
                Circle()
//                RoundedRectangle(cornerRadius: 25.0)
            )
            .shadow(color: Color.blue, radius: 10, x: 0, y: 0)        
    }
}

struct ImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ImageBootcamp()
    }
}
