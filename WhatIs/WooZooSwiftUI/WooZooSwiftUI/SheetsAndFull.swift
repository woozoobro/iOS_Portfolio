//
//  SheetsAndFull.swift
//  WooZooSwiftUI
//
//  Created by 우주형 on 2023/07/21.
//

import SwiftUI

struct SheetsAndFull: View {
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Button("새로운 뷰가 뜨게 할래요") {
                isPresented.toggle()
            }
            
            Text("어디다 sheet을 붙여야할까요?")
        }
        .fullScreenCover(isPresented: $isPresented) {
            ShitView()
        }
        
    }
}

struct ShitView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.green
                .ignoresSafeArea()
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.largeTitle)
                    .padding()
            }
        }
    }
}

struct SheetsAndFull_Previews: PreviewProvider {
    static var previews: some View {
        SheetsAndFull()
    }
}
