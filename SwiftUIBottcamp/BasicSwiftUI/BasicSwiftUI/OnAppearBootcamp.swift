//
//  OnAppearBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/18.
//

import SwiftUI

struct OnAppearBootcamp: View {
    @State var myText: String = "Start text."
    @State var count: Int = 0
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                            }
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    myText = "This is the new Text"
                }
            }
            .onDisappear {
                myText = "Ending text."
            }
            .navigationTitle("On Appear: \(count)")
        }
    }
}

struct OnAppearBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearBootcamp()
    }
}
