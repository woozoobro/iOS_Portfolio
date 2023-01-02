//
//  SecondView.swift
//  EnvironmentObject
//
//  Created by 우주형 on 2023/01/03.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack (spacing: 30) {
            
            NavigationLink {
                ThirdView()
            } label: {
                Text("Third View")
            }
        }
        .navigationTitle("Second View")
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
