//
//  ScrollViewBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/15.
//

import SwiftUI

//struct ScrollViewBootcamp: View {
//    var body: some View {
//        ScrollView {
//            LazyVStack {
//                ForEach(0..<100) { index in
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        LazyHStack {
//                            ForEach(0..<5) { index in
//                                RoundedRectangle(cornerRadius: 25)
//                                    .fill(.white)
//                                    .frame(width: 200, height: 150)
//                                    .shadow(radius: 10)
//                                    .padding()
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//}

struct ScrollViewBootcamp: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<10) { index in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<12) { index in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    }
                    
                }
            }
        }
    }
}

struct ScrollViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewBootcamp()
    }
}
