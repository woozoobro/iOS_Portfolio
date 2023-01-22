//
//  ContentView.swift
//  RustRoulette
//
//  Created by 우주형 on 2023/01/23.
//

import SwiftUI

struct ContentView: View {
    
    let list = NumberArray.list
    @State var randomNumber: Int = 0
//    @State var selectedNumber: Int = 0
    @State var userSeed = 100
    @State var randomDisabled: Bool = true
    
    var body: some View {
        VStack(spacing: 20) {
//            Text("You selected 1")
            Text("\(randomNumber)")
            
            Button {
                randomNumber = list.randomElement() ?? 0
                randomDisabled = true
            } label: {
                Text("Random")
            }.font(.largeTitle)
                .disabled(randomDisabled)
                
            
            Text("Seed: \(userSeed)")
            
            HStack {
                Button {
                    randomDisabled = false
                } label: {
                    Text("1")
                }
                
                
                Button {
                    randomDisabled = false
                } label: {
                    Text("3")
                }
                
                Button {
                    randomDisabled = false
                } label: {
                    Text("5")
                }
                
                Button {
                    randomDisabled = false
                } label: {
                    Text("10")
                }
                
                Button {
                    randomDisabled = false
                } label: {
                    Text("20")
                }
            }
            .font(.title)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
