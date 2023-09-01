//
//  ImageView.swift
//  SwiftUIImageViewer
//
//  Created by 우주형 on 2023/08/23.
//

import SwiftUI

struct ImageView: View {
    @EnvironmentObject var homeData: HomeViewModel
    @State var scale: CGFloat = 1
    @State var offset: CGSize = .zero
    @State var bgOpacity: Double = 1
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .opacity(bgOpacity)
            
            TabView(selection: $homeData.selectedImagesID) {
                ForEach(homeData.allImages, id: \.self) { image in
                    Image(systemName: image)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .tag(image)
                        .offset(y: offset.height)
                        .scaleEffect(scale)
                        .gesture(
                            MagnificationGesture()
                                .onChanged({ value in
                                    withAnimation(.spring()) {
                                        scale = value
                                    }
                                })
                                .onEnded({ value in
                                    withAnimation(.spring()) {
                                        scale = 1
                                    }
                                })
                        )
                }
            }
            .tabViewStyle(.page)
            .overlay(alignment: .topTrailing) {
                Button {
                    withAnimation(.default) {
                        homeData.showImageViewer.toggle()
                    }
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.35))
                        .clipShape(Circle())
                }
                .padding(10)
            }
            
        }
        .gesture(
            DragGesture()
                .onChanged({ value in
                    offset = value.translation
                    let halgHeight: Double = 200
                    let progress = offset.height / halgHeight
                    withAnimation(.spring()) {
                        bgOpacity = Double(1 - (progress < 0 ? -progress : progress))
                    }
                })
                .onEnded({ value in
                    withAnimation(.easeInOut) {
                        var translation = value.translation.height
                        if translation < 0 {
                            translation = -translation
                        }
                        if translation < 200 {
                            offset = .zero
                            bgOpacity = 1
                        } else {
                            homeData.showImageViewer.toggle()
                            offset = .zero
                        }
                    }
                })
        )
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
