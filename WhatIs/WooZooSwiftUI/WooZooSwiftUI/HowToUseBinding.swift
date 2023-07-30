//
//  HowToUseBinding.swift
//  WooZooSwiftUI
//
//  Created by 우주형 on 2023/07/17.
//

import SwiftUI

struct HowToUseBinding: View {
    @Binding var title: String
    
    var body: some View {
        Text(title)
    }
}

struct HowToUseBinding_Previews: PreviewProvider {
    static var previews: some View {
        HowToUseBinding(title: .constant("안녕하세요"))
    }
}
