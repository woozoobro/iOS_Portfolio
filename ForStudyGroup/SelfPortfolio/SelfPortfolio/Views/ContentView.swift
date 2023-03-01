//
//  ContentView.swift
//  SelfPortfolio
//
//  Created by 우주형 on 2023/03/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                ProfileView()
                
                SkillHeader()
                SkillHeader()
                SkillHeader()
                SkillHeader()
                SkillHeader()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
