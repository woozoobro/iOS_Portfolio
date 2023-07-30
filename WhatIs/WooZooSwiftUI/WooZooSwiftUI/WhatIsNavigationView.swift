//
//  WhatIsNavigationView.swift
//  WooZooSwiftUI
//
//  Created by 우주형 on 2023/07/24.
//

import SwiftUI

struct WhatIsNavigationView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HomeView()
            }
            .navigationTitle("네비게이션타이틀이 여기")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct HomeView:View {
    
    var body: some View {
        NavigationLink {
            HomeDestinationView()
        } label: {
            Text("여기는 홈뷰")
        }
    }
}

struct HomeDestinationView:View {
    init() {
        print("목적지가 되는 뷰가 생성되었습니다")
    }
    
    var body: some View {
        Text("목적지가 되는뷰")
    }
}

struct WhatIsNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        WhatIsNavigationView()
    }
}
