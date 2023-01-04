//
//  UIBarButtonItem+CustomView.swift
//  CarrotHomeTab
//
//  Created by 우주형 on 2023/01/05.
//

import UIKit

extension UIBarButtonItem {
    static func generate(with config: CustomBarItemConfiguration, width: CGFloat? = nil) -> UIBarButtonItem {
        let customView = CustomBarItem(config: config)
        if let width = width {
            NSLayoutConstraint.activate([customView.widthAnchor.constraint(equalToConstant: width)])
        }
        let barButtonItem = UIBarButtonItem(customView: customView)
        return barButtonItem
    }
}
