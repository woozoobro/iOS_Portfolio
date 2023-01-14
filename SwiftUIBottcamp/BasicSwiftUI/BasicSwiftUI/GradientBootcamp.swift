//
//  GradientBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/14.
//

import SwiftUI

struct GradientBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
                //Color.red
//                LinearGradient(colors: [Color.red, Color.blue] ,startPoint: .topLeading, endPoint: .trailing)
//                RadialGradient(gradient: Gradient(colors: [Color.red, Color.blue]),
//                               center: .center, startRadius: 5, endRadius: 200)
                AngularGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .topLeading, angle: .degrees(180))
            )
            .frame(width: 300, height: 200)
            
    }
}

struct GradientBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GradientBootcamp()
    }
}
