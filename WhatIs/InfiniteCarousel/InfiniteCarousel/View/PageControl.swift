//
//  PageControl.swift
//  InfiniteCarousel
//
//  Created by 우주형 on 2023/06/20.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
    /// Page Properties
    var totalPages: Int
    var currentPage: Int
    func makeUIView(context: Context) -> some UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = totalPages
        control.currentPage = currentPage
        control.backgroundStyle = .prominent
        control.allowsContinuousInteraction = false
        
        return control
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.numberOfPages = totalPages
        uiView.currentPage = currentPage
    }
    
}

