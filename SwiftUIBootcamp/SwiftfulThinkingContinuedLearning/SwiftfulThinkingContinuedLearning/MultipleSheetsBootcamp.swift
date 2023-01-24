//
//  MultipleSheetsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 우주형 on 2023/01/24.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id: UUID = UUID()
    let title: String
}

// 1 - use a binding
// 2 - use multiple .sheets
// 3 - use $item

struct MultipleSheetsBootcamp: View {
    
    @State var selectedModel: RandomModel = RandomModel(title: "STARTING TITLE")
    @State var showSheet: Bool = false
    @State var showSheet2: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button("Button 1") {
                showSheet.toggle()
            }
            .sheet(isPresented: $showSheet) {
                NextScreen(selectedModel: RandomModel(title: "ONE"))
            }
            
            Button("Button 2") {
                showSheet2.toggle()
            }
            .sheet(isPresented: $showSheet2) {
                NextScreen(selectedModel: RandomModel(title: "TWO"))
            }
        }
    }
}

struct NextScreen: View {
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}
