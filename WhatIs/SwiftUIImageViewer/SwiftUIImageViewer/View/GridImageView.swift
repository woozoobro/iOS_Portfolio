//
//  GridImageView.swift
//  SwiftUIImageViewer
//
//  Created by 우주형 on 2023/08/23.
//

import SwiftUI

struct GridImageView: View {
    @EnvironmentObject var homeData: HomeViewModel
    var index: Int
    var body: some View {
        Button {
            withAnimation(.easeInOut) {
                // For Page Tab View Automatic Scrolling...
                homeData.selectedImagesID = homeData.allImages[index]
                homeData.showImageViewer.toggle()
            }
            
        } label: {
            ZStack {
                //Showing only Four Grids.
                if index <= 3 {
                    Image(systemName: homeData.allImages[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: getWidth(index: index), height: 120)
                        .cornerRadius(12)
                }
                
                //Showing the rest of image count
                if homeData.allImages.count > 4 && index == 3 {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.black.opacity(0.3))
                    
                    let remainingImages = homeData.allImages.count - 4
                    Text("+\(remainingImages)")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
            }
        }

    }
    
    // expanding Image Size when space is available...
    func getWidth(index: Int) -> CGFloat {
        let width = getRect().width - 100
        if homeData.allImages.count % 2 == 0 {
            return width / 2
        } else {
            if index == homeData.allImages.count - 1 {
                return width
            } else {
                return width / 2
            }
        }
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
