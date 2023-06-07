//
//  ContentView.swift
//  Commute
//
//  Created by 우주형 on 2023/06/07.
//

import SwiftUI

extension Date {
    func toString() -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "yy.MM.dd.(EEE) HH:mm:ss"
            formatter.locale = Locale(identifier: "ko_KR")
            return formatter.string(from: self)
        }
}


struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            Text("ResultView")
                .tabItem {
                    Image(systemName: "house.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}
