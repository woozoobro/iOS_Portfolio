//
//  ContentView.swift
//  SheetDetents
//
//  Created by 우주형 on 2023/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    var body: some View {
        Button {
            isPresented.toggle()
        } label: {
            Text("Sheet 띄우기")
        }
        .padding()
        .sheet(isPresented: $isPresented) {
            SheetView()
                .presentationDetents([.medium])
                .presentationDragIndicator(.hidden)
        }
    }
}

struct SheetView: View {
    var body: some View {
        NavigationStack {
            Group {
                Text("띄워질 뷰")
            }
            .navigationTitle("상태메시지 올리기")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
