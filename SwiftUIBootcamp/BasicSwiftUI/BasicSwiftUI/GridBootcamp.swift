//
//  GridBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/15.
//

import SwiftUI

//struct GridBootcamp: View {
//
//    let columns: [GridItem] = [
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//    ]
//
//    var body: some View {
//
//        ScrollView {
//            Rectangle()
//                .fill(.orange)
//                .frame(height: 400)
//            LazyVGrid(columns: columns,
//                      alignment: .center,
//                      spacing: nil,
//                      pinnedViews: [.sectionHeaders]) {
//                Section {
//                    ForEach(0..<6) { index in
//                        Rectangle()
//                            .frame(height: 150)
//                    }
//                } header: {
//                    Text("Section1")
//                        .foregroundColor(.white)
//                        .font(.title)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .background(.blue)
//                        .padding()
//                }
//                Section {
//                    ForEach(0..<20) { index in
//                        Rectangle()
//                            .frame(height: 150)
//                    }
//                } header: {
//                    Text("Section2")
//                        .foregroundColor(.white)
//                        .font(.title)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .background(.green)
//                        .padding()
//                }
//            }
//        }
//    }
//}

struct GridBootcamp: View {
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
    ]
    
    var body: some View {
        ScrollView {
            
            Rectangle()
                .fill(.orange)
                .frame(height: 400)
            
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .frame(height: 150)
                        }
                    } header: {
                        Text("Section 1")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.blue)
                            .padding()
                    }
                    
                    Section {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .fill(Color.green)
                                .frame(height: 150)
                        }
                    } header: {
                        Text("Section 2")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.red)
                            .padding()
                    }
                }
        }
    }
}

struct GridBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GridBootcamp()
    }
}
