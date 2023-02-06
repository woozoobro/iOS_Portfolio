//
//  GeometryReaderBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 우주형 on 2023/01/23.
//

import SwiftUI

//struct GeometryReaderBootcamp: View {
//
//    func getPercentage(geo: GeometryProxy) -> Double {
//        let maxDistance = UIScreen.main.bounds.width / 2
//        let currentX = geo.frame(in: .global).midX
//        return Double(1 - (currentX / maxDistance))
//    }
//
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack {
//                ForEach(0..<20) { index in
//                    GeometryReader { geomtry in
//                        RoundedRectangle(cornerRadius: 20)
//                            .rotation3DEffect(Angle(degrees: getPercentage(geo: geomtry) * 40),
//                                              axis: (x: 0.0, y: 1.0, z: 0.0))
//                    }
//                    .frame(width: 300, height: 250)
//                    .padding()
//                }
//            }
//        }
//    }
//}

struct GeometryReaderBootcamp: View {

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false ) {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(Angle(degrees: getPercentage(geo: geometry) * 40), axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        }
    }
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
}

struct GeometryReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderBootcamp()
    }
}
