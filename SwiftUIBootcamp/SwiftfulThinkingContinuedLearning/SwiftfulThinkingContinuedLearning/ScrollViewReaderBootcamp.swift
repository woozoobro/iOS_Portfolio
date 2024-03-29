//
//  ScrollViewReaderBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 우주형 on 2023/01/23.
//

import SwiftUI

//struct ScrollViewReaderBootcamp: View {
//
//    @State var scrollToIndex: Int = 0
//    @State var textFiledText: String = ""
//
//    var body: some View {
//        VStack {
//            TextField("Enter a # here...", text: $textFiledText)
//                .frame(height: 55)
//                .border(.gray)
//                .padding(.horizontal)
//                .keyboardType(.numberPad)
//
//            Button("Scroll Now") {
//                withAnimation(.spring()) {
//                    if let index = Int(textFiledText) {
//                        scrollToIndex = index
//                    }
//                }
//            }
//
//            ScrollView {
//                ScrollViewReader { proxy in
//
//                    ForEach(0..<50) { index in
//                        Text("This is item #\(index)")
//                            .font(.headline)
//                            .frame(height: 200)
//                            .frame(maxWidth: .infinity)
//                            .background(.white)
//                            .cornerRadius(10)
//                            .shadow(radius: 10)
//                            .padding()
//                            .id(index)
//                    }
//                    .onChange(of: scrollToIndex) { value in
//                        withAnimation(.spring()) {
//                            proxy.scrollTo(value, anchor: .top)
//                        }
//                    }
//                }
//            }
//        }
//    }
//}

struct ScrollViewReaderBootcamp: View {
    
    @State var textFieldText: String = ""
    @State var scrollToIndex: Int = 0
    var body: some View {
        VStack {
            TextField("Enter a # here...", text: $textFieldText)
                .frame(height: 55)
                .border(.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            Button("Scroll Now") {
                withAnimation(.spring()) {
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                    }
                }
            }
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { newValue in
                        withAnimation(.spring()) {
                            proxy.scrollTo(newValue, anchor: .top)
                        }
                    }
                }
            }
        }
    }
}

struct ScrollViewReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderBootcamp()
    }
}
