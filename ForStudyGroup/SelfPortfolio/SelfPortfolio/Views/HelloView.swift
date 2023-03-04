//
//  HelloView.swift
//  SelfPortfolio
//
//  Created by 우주형 on 2023/03/04.
//

import SwiftUI

struct HelloView: View {
    var body: some View {
        ScrollView {
            WhatIsView()
            WhatIsView()
            WhatIsView()
        }
    }
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        HelloView()
    }
}
