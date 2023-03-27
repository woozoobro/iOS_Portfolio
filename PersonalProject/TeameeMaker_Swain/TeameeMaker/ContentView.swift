//
//  ContentView.swift
//  TeameeMaker
//
//  Created by Swain Yun on 2023/03/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var teameeMakerViewModel: TeameeMakerViewModel
    
    @State private var tabViewSelection = NavigationTitleType.teameeListView
    
    var body: some View {
        TabView(selection: $tabViewSelection) {
            TeameeListView()
                .tabItem {
                    Label("참가자", systemImage: "person.3.fill")
                }
                .tag(NavigationTitleType.teameeListView)
            
            TaskListView()
                .tabItem {
                    Label("일정", systemImage: "calendar")
                }
                .tag(NavigationTitleType.taskListView)
        }
        .padding()
        .navigationTitle(tabViewSelection.navigationTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
        .environmentObject(TeameeMakerViewModel())
    }
}
