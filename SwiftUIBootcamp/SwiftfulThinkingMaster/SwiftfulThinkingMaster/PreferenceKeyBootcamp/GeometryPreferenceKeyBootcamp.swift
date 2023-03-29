//
//  GeometryPreferenceKeyBootcamp.swift
//  SwiftfulThinkingMaster
//
//  Created by 우주형 on 2023/03/29.
//

import SwiftUI

struct GeometryPreferenceKeyBootcamp: View {
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .frame(width: rectSize.width, height: rectSize.height)
                .background(Color.blue)
            
            Spacer()
            HStack {
                Rectangle()
                
                GeometryReader { geo in
                    Rectangle()
                        .updateRectangleGeoSize(geo.size)
                }
                Rectangle()
            }
            .frame(height: 55)
        }
        .onPreferenceChange(RectangleGeometrySizePreferenceKey.self) { value in
            self.rectSize = value
        }
    }
}

struct RectangleGeometrySizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

extension View {
    func updateRectangleGeoSize(_ size: CGSize) -> some View {
        preference(key: RectangleGeometrySizePreferenceKey.self, value: size)
    }
}

struct GeometryPreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryPreferenceKeyBootcamp()
    }
}

