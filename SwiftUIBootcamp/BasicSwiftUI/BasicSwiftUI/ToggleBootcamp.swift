//
//  ToggleBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/17.
//

import SwiftUI

struct ToggleBootcamp: View {
    
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Status:")
                Text(toggleIsOn ? "Online":"Offline")
            }
            .font(.largeTitle)
            
            Toggle(isOn: $toggleIsOn) {
                Text("Change status")
            }
            .toggleStyle(.switch)
            .tint(.orange)
            
            Spacer()
        }
        .padding([.horizontal, .top], 30 )
    }
}

struct ToggleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ToggleBootcamp()
    }
}
