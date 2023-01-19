//
//  ButtonsBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/16.
//

import SwiftUI

struct ButtonsBootcamp: View {
    @State var title = "This is my title"
    
    var body: some View {
        VStack(spacing: 20){
            Text(title)
            Button("Press me!") {
                self.title = "Button was Pressed"
            }
            .tint(.red)
            
            Button {
                self.title = "Button #2 was Pressed"
            } label: {
                Text("Save".uppercased())
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.blue
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    )
            }
            Button {
                self.title = "Button #3"
            } label: {
                Circle()
                    .fill(.white)
                    .frame(width: 75, height: 75, alignment: .center)
                    .shadow(radius: 10)
                    .overlay(
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    )
            }
            Button {
                self.title = "Button #5"
            } label: {
                Text("Finish".uppercased())
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(.gray, lineWidth: 2.0)
                    )
            }



        }
    }
}

struct ButtonsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsBootcamp()
    }
}
