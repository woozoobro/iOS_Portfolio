//
//  SahpesBootCamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/14.
//

import SwiftUI

struct SahpesBootCamp: View {
    var body: some View {
//        Circle()
//            .fill(Color.blue)
//            .foregroundColor(.pink)
//            .stroke()
//            .stroke(Color.red)
//            .stroke(Color.blue, lineWidth: 30)
//            .stroke(Color.orange, style: StrokeStyle(lineWidth: 30, lineCap: .round, dash: [30]))
//            .trim(from: 0.2, to: 1.0)
//            .stroke(Color.purple, lineWidth: 50)
//        Ellipse()
//        Capsule(style: .circular)
//            .frame(width: 200, height: 100)
//        Rectangle()
        RoundedRectangle(cornerRadius: 50)
            .frame(width: 300, height: 200)
            .padding()
    }
}

struct ShapesBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        SahpesBootCamp()
    }
}
