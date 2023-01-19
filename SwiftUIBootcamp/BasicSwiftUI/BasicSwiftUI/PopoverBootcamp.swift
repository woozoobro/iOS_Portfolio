//
//  PopoverBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/16.
//

import SwiftUI

struct PopoverBootcamp: View {
    
    @State var showNewScreen: Bool = false
    var body: some View {
        ZStack {
            Color.orange.edgesIgnoringSafeArea(.all)
            
            VStack {
                Button("Button") {                    
                    showNewScreen.toggle()
                }
                .font(.largeTitle)
                Spacer()
            }
            // Method 1 - Sheet
//            .sheet(isPresented: $showNewScreen) {
//                NewScreen()
//            }
            
            // Method 2 - Transition
            .sheet(isPresented: $showNewScreen) {
                NewScreen(showNewScreen: $showNewScreen)
                    .padding(.top, 100)
                    .animation(.spring(), value: showNewScreen)
                    .transition(.move(edge: .leading))
            }
        }
    }
}

struct NewScreen: View {
    @Environment(\.dismiss) var presentationMode
    @Binding var showNewScreen: Bool
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple
                .edgesIgnoringSafeArea(.all)
            
            Button {
                //presentationMode()
                showNewScreen.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }
        }
    }
}

struct PopoverBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PopoverBootcamp()
    }
}
