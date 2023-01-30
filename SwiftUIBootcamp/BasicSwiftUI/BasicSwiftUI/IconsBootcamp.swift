//
//  IconsBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/14.
//

import SwiftUI

struct IconsBootcamp: View {
    var body: some View {
        Image(systemName: "person.fill.badge.plus")
            .renderingMode(.original)
//            .font(.largeTitle)
//            .font(.system(size: 200))
            .resizable()
            .aspectRatio(contentMode: .fit)
//            .scaledToFill()
//            .foregroundColor(.green)
            .frame(width: 300, height: 300)
            .clipped()
    }
}

struct IconsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IconsBootcamp()
    }
}
