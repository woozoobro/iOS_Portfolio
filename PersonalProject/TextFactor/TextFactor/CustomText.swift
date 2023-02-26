//
//  CustomText.swift
//  TextFactor
//
//  Created by 우주형 on 2023/02/26.
//

import Foundation
import SwiftUI

struct CustomText: UIViewRepresentable {
    let text: String
    let font: UIFont
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        
        label.font = font
        label.numberOfLines = 0
        
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.8  // <- Reduce lineHeight with a <1 factor
        
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSMakeRange(0, attributedString.length))
        
        label.attributedText = attributedString
        
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) { }
}
