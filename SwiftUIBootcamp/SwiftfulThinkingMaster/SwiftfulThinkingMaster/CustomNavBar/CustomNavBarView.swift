//
//  CustomNavBarView.swift
//  SwiftfulThinkingMaster
//
//  Created by 우주형 on 2023/03/31.
//

import SwiftUI

struct CustomNavBarView: View {
    var body: some View {
        HStack {
            backButton
            Spacer()
            
            Spacer()
            backButton
            .opacity(0)
        }
        .padding()
        .tint(.white)
        .foregroundColor(.white)
        .font(.headline)
        .background(Color.blue.ignoresSafeArea(edges: .top))
    }
}

extension CustomNavBarView {
    private var backButton: some View {
        Button {
            
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text("Title")
                .font(.title)
                .fontWeight(.semibold)
            Text("Subtitle goes here")
        }
    }
}


struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavBarView()
            Spacer()
        }
    }
}
