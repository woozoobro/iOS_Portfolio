//
//  TextView.swift
//  SwiftUI_Basic
//
//  Created by 우주형 on 2023/01/01.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.system(size: 40, weight: .bold, design: .default))
            
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
