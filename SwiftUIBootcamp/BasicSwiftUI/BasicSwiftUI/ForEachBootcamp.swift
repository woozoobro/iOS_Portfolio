//
//  ForEachBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/15.
//

import SwiftUI

struct ForEachBootcamp: View {
    /*
    private struct NamedFont: Identifiable {
        let name: String
        let font: Font
        var id: String { name }
    }

    private let namedFonts: [NamedFont] = [
        NamedFont(name: "Large Title", font: .largeTitle),
        NamedFont(name: "Title", font: .title),
        NamedFont(name: "Headline", font: .headline),
        NamedFont(name: "Body", font: .body),
        NamedFont(name: "Caption", font: .caption)
    ]
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(namedFonts) { namedFont in
                Text(namedFont.name)
                    .font(namedFont.font)
            }
        }
    }
    */
    
    let data: [String] = [
        "Hi", "Hello", "Hey everyone", "Hi"
    ]
    let myString: String = "Hello"
    
    var body: some View {
        VStack {
            ForEach(data.indices, id: \.self) { index in
                Text("\(data[index]): \(index)")
            }
        }
    }
}

struct ForEachBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ForEachBootcamp()
    }
}
