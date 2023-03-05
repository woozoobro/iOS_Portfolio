//
//  WhatIsView.swift
//  SelfPortfolio
//
//  Created by 우주형 on 2023/03/03.
//

import SwiftUI

struct WhatIsView: View {
    
    var body: some View {
        VStack {
            Color.green
                .frame(height: 300)
            
            Text("Hello world!")
                .font(.largeTitle)
            
            Circle()
            
            Image(systemName: "xmark")
        }
    }
}

struct WhatIsView_Previews: PreviewProvider {
    static var previews: some View {
        WhatIsView()
    }
}
