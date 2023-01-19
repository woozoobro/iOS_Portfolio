//
//  PaddingAndSpacerBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/15.
//

import SwiftUI

struct PaddingAndSpacerBootcamp: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .background(Color.yellow)
            //            .padding()
                .padding(.all, 30)
                .background(Color.blue)
            Text("This is the description of what we will do on this screen. It is multiple lines and we will align the text to the leading edge.")
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        .padding()
        .background(.green)
    }
}

struct PaddingAndSpacerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PaddingAndSpacerBootcamp()
    }
}
