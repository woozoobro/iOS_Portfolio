//
//  HomeView.swift
//  KyleMemoApp
//
//  Created by 우주형 on 2023/08/22.
//

import SwiftUI


struct HomeView: View {
    
    @State var isPresented: Bool = false
    
    var body: some View {
        HStack {
            channelSection
            boardSection
        }
    }
}

extension HomeView {
    private var channelSection: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(0..<15) { i in
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .background(.blue)
        }
    }
    
    private var boardSection: some View {
        VStack {
            VStack {
                HStack {
                    Text("✅ Board")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "ellipsis")
                    }
                }
                .padding()
                
                Button(action: {}) {
                    Text("Invite")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.gray)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                .tint(.white)
                
                Button(action: {
                    isPresented.toggle()
                }) {
                    Text("Browse Channels")
                    Spacer()
                    Text("NEW")
                        .font(.callout)
                        .padding(2)
                        .background{
                            Capsule(style: .continuous)
                                .fill(.purple)
                        }
                }
                .fullScreenCover(isPresented: $isPresented) {
                    BrowseChannel()
                }
                
            }
            
            
            ScrollView(.vertical, showsIndicators: true) {
                ForEach(0..<25) { i in
                    Rectangle()
                        .frame(height: 50)
                    
                }
            }
        }
    }
}

struct BrowseChannel: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("채널 뷰")
            .onTapGesture {
                dismiss()
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
