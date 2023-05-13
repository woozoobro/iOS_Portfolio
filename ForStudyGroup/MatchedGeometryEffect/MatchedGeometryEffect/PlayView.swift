//
//  PlayView.swift
//  MatchedGeometryEffect
//
//  Created by 우주형 on 2023/05/13.
//

import SwiftUI

struct PlayView: View {
    var namespace: Namespace.ID
    
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 30)
                .matchedGeometryEffect(id: "cover", in: namespace)
                .frame(height: 300)
                .padding()
            Text("Put your records on")
                .font(.title)
                .frame(maxWidth: .infinity)
                .matchedGeometryEffect(id: "title", in: namespace)
            
            HStack {
                Image(systemName: "play.fill")
                    .matchedGeometryEffect(id: "play", in: namespace)
                Image(systemName: "forward.end.fill")
                    .matchedGeometryEffect(id: "next", in: namespace)
            }
            .font(.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.purple)
                .matchedGeometryEffect(id: "background", in: namespace)
        }
        .foregroundColor(.white)
        .ignoresSafeArea()
    }
}

struct PlayView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        PlayView(namespace: namespace)
    }
}
