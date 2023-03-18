//
//  ExtractedFunctionBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/16.
//

import SwiftUI

struct ExtractedFunctionBootcamp: View {
    
    @State var backgroundColor: Color = Color.green
    
    var body: some View {
        ZStack {
            //background
            backgroundColor
                .ignoresSafeArea()
            
            contentLayer
        }
    }
    
    func buttonPressed() {
        backgroundColor = .yellow
    }
}


//MARK: - Components
extension ExtractedFunctionBootcamp {
    var contentLayer: some View {
        VStack {
            Text("Title")
                .font(.largeTitle)
            Button {
                buttonPressed()
            } label: {
                Text("Press me")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
            }
        }
    }
}

struct ExtractedFunctionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractedFunctionBootcamp()
    }
}


/*
 var contentLayer: some View {
 VStack {
 Text("Title")
 .font(.largeTitle)
 Button {
 buttonPressed()
 } label: {
 Text("Press me")
 .font(.headline)
 .foregroundColor(.white)
 .padding()
 .background(.black)
 .cornerRadius(10)
 }
 }
 }
 */
