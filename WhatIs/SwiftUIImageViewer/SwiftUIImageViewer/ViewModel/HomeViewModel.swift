//
//  HomeViewModel.swift
//  SwiftUIImageViewer
//
//  Created by 우주형 on 2023/08/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    // Replace iwth your image Model...
    @Published var allImages: [String] = [
        "square.and.arrow.up.circle.fill",
        "rectangle.portrait.and.arrow.right",
        "pencil.circle",
        "eraser.fill",
        "scribble.variable",
        "lasso",
        "paperplane.fill",
        "tray.circle.fill",
        "xmark.bin.fill",
        "arrowshape.turn.up.forward.circle.fill",
        "book.circle.fill",
    ]
    
    // Properties For Image Viewer...
//    @Published var selectedImages: [String] = []
    @Published var showImageViewer: Bool = false
    @Published var selectedImagesID: String = ""
    @Published var imageViewerOffset: CGSize = .zero
    
//    @Published var allImages: [String] = [
//        "square.and.arrow.up.circle.fill",
//        "rectangle.portrait.and.arrow.right",
//        "pencil.circle",
//    ]
}
