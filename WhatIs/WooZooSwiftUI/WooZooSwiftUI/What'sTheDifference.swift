//
//  What'sTheDifference.swift
//  WooZooSwiftUI
//
//  Created by 우주형 on 2023/07/21.
//

import SwiftUI

struct What_sTheDifference: View {
    @State var showNewScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                Button("Button") {
                    withAnimation {
                        showNewScreen.toggle()
                    }
                }
                .font(.largeTitle)
                                
            }

            NewScreen(showNewScreen: $showNewScreen)
            
        }
    }
}

struct NewScreen: View {
    @Binding var showNewScreen: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.white
                LazyVStack {
                    ForEach(0...100, id:\.self) { _ in
                        Text("새로운 뷰입니다")
                    }
                }
            }
            .offset(y: showNewScreen ? 0 : geo.frame(in:.global).size.height)
        }
    }
}

struct What_sTheDifference_Previews: PreviewProvider {
    static var previews: some View {
        What_sTheDifference()
    }
}
