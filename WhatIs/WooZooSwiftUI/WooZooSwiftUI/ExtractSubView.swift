//
//  ExtractSubView.swift
//  WooZooSwiftUI
//
//  Created by 우주형 on 2023/07/17.
//

import SwiftUI

struct ExtractSubView: View {
    
    @State var backgroundColor: Color = Color.green
    
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
        }
    }
        
}




struct ExtractSubView_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSubView()
    }
}


