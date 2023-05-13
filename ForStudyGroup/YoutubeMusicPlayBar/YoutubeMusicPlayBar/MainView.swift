//
//  MainView.swift
//  YoutubeMusicPlayBar
//
//  Created by 우주형 on 2023/05/13.
//

import SwiftUI

struct MainView: View {
    @State var show: Bool = false
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            
            if !show {
                HStack(spacing: 16) {
                    RoundedRectangle(cornerRadius: 10)
                        .matchedGeometryEffect(id: "cover", in: namespace)
                        .frame(width: 44, height: 44)
                    
                    Text("Put Your Records On")
                        .frame(maxWidth: .infinity)
                        .matchedGeometryEffect(id: "title", in: namespace)
                    Spacer()
                    Image(systemName: "play.fill")
                        .matchedGeometryEffect(id: "play", in: namespace)
                    Image(systemName: "forward.end.fill")
                        .matchedGeometryEffect(id: "next", in: namespace)
                }
                .frame(maxWidth: .infinity, maxHeight: 44)
                .padding(8)
                .background {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.blue.opacity(0.5))
                        .matchedGeometryEffect(id: "background", in: namespace)
                }
            } else {
                PlayView(namespace: namespace)
            }
        }
        .foregroundColor(.white)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
