//
//  TabViewBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/17.
//

import SwiftUI

//struct TabViewBootcamp: View {
//
//    @State var selectedTab: Int = 2
//    let icons: [String] = [
//        "heart.fill", "globe", "house.fill", "person.fill"
//    ]
//
//    var body: some View {
//        TabView {
//            ForEach(icons, id: \.self) { icon in
//                Image(systemName: icon)
//                    .resizable()
//                    .scaledToFit()
//            }
//        }
//        .background(
//            RadialGradient(colors: [Color.red, Color.blue], center: .center, startRadius: 5, endRadius: 300)
//        )
//        .frame(height: 300)
//        .tabViewStyle(.page)
//
////        TabView(selection: $selectedTab) {
////            HomeView(selectedTab: $selectedTab)
////                .tabItem { Label("Home", systemImage: "house.fill") }
////                .tag(0)
////            Text("Browse Tab")
////                .tabItem {
////                    Label("Browse", systemImage: "globe")
////                }.tag(1)
////            Text("Profile Tab")
////                .tabItem {
////                    Label("Profile", systemImage: "person.fill")
////                }.tag(2)
////        }
////        .tint(.green)
//    }
//}
//
//struct HomeView: View {
//    @Binding var selectedTab: Int
//    var body: some View {
//        ZStack {
//            Color.blue.ignoresSafeArea()
//            VStack {
//                Text("Home Tab")
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
//                Button {
//                    selectedTab = 2
//                } label: {
//                    Text("Go to profile")
//                        .font(.headline)
//                        .padding()
//                        .padding(.horizontal)
//                        .background(.white)
//                }
//            }
//        }
//    }
//}

struct TabViewBootcamp: View {
        
    let icons: [String] = [
        "heart.fill", "globe", "house.fill", "person.fill"
    ]
    
    var body: some View {
        TabView {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .padding(30)
            }
        }
        .background(
            RadialGradient(gradient: Gradient(colors: [.red, .blue]), center: .center, startRadius: 5, endRadius: 300)
        )
        .frame(height: 300)
        .tabViewStyle(.page)
    }
}

struct HomeView: View {
    @Binding var selectTab: Int
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack {
                Text("Home Tab")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Button {
                    selectTab = 2
                } label: {
                    Text("Go to Profile")
                        .font(.headline)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct TabViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBootcamp()
    }
}
