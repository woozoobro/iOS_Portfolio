//
//  ResizableSheetBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/06/10.
//

import SwiftUI

struct ResizableSheetBootcamp: View {
    @State private var showSheet: Bool = false
    @State private var detents: PresentationDetent = .large
    var body: some View {
        Button("Click me!") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            MyNextView(detents: $detents)
                .presentationDetents([.medium, .large], selection: $detents)
//                .presentationDetents([.fraction(0.75), .large])
//                .presentationDetents([.medium, .large])
//                .presentationDragIndicator(.hidden)
//                .interactiveDismissDisabled()
        }
    }
}

struct MyNextView: View {
    @Binding var detents: PresentationDetent
    var body: some View {
        ZStack {
            Color.indigo.ignoresSafeArea()
            VStack(spacing: 20) {
                Button("Medium") {
                    detents = .medium
                }
                Button("Large") {
                    detents = .large
                }
            }
        }
    }
}

struct ResizableSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ResizableSheetBootcamp()
    }
}
