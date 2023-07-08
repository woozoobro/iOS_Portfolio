//
//  ContentView.swift
//  NavigationStackTest
//
//  Created by 우주형 on 2023/07/06.
//

import SwiftUI

struct ContentView: View {
    @State private var path: NavigationPath = .init()
    @State private var selection: Int = 0
    var body: some View {
        NavigationStack(path: $path){
            TabView(selection: $selection) {
                OnBoardingView(path: $path)
                    .navigationDestination(for: ViewOptions.self) { option in
                        option.view($path)
                    }
                    .tag(0)
                    .tabItem {
                        Image(systemName: "xmark")
                    }
                ScrollView {
                    ForEach(0..<20, id: \.self) { i in
                        Text("\(i)")
                            .onTapGesture {
                                path.append(ContentView.ViewOptions.register)
                            }
                    }
                }
                .tag(1)
                .tabItem {
                    Image(systemName: "house")
                }
            }
            
        }
    }
    //Create an `enum` so you can define your options
    enum ViewOptions{
        case userTypeView
        case register
        //Assign each case with a `View`
        @ViewBuilder func view(_ path: Binding<NavigationPath>) -> some View{
            switch self{
            case .userTypeView:
                UserTypeView(path: path)
            case .register:
                RegisterView()
            }
        }
    }
}

struct OnBoardingView: View {
    @Binding var path: NavigationPath
    var body: some View {
        Button {
            //Append to the path the enum value
            path.append(ContentView.ViewOptions.userTypeView)
        } label: {
            Text("Hello2222")
        }
        
    }
}

struct UserTypeView: View {
    @Binding var path: NavigationPath
    var body: some View {
        Button {
            //Append to the path the enum value
            path.append(ContentView.ViewOptions.register)
        } label: {
            Text("Hello3333")
        }
        
    }
}

struct RegisterView: View {
    var body: some View {
        Text("Register")        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
