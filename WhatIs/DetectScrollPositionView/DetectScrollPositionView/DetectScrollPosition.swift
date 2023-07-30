//
//  DetectScrollPosition.swift
//  DetectScrollPositionView
//
//  Created by 우주형 on 2023/07/21.
//

import SwiftUI

struct DetectScrollPosition: View {
    @State private var scrollPosition: CGPoint = .zero
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach((1...200), id: \.self) { row in
                        Text("Row \(row)")
                            .frame(height: 30)
                            .id(row)
                    }
                }
                .background(GeometryReader { geometry in
                    Color.clear
                        .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin)
                })
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    self.scrollPosition = value
                }
            }
            .coordinateSpace(name: "scroll")
            .navigationTitle("Scroll offset: \(scrollPosition.y)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}
struct DetectScrollPosition_Previews: PreviewProvider {
    static var previews: some View {
        DetectScrollPosition()
    }
}
