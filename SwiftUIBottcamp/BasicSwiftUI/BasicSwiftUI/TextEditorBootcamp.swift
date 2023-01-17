//
//  TextEditorBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/17.
//

import SwiftUI

struct TextEditorBootcamp: View {
    
    @State var textEditorText: String = "This is the starting text."
    @State var savedText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $textEditorText)
                    .frame(height: 250)
//                    .foregroundColor(.blue)
                    .colorMultiply(.init(.systemGray4))
                    .cornerRadius(10)
                Button {
                    savedText = textEditorText
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                }
                Text(savedText)
                Spacer()
            }
            .padding()
            //.background(.green)
            .navigationTitle("TextEditor")
        }
    }
}

struct TextEditorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorBootcamp()
    }
}
