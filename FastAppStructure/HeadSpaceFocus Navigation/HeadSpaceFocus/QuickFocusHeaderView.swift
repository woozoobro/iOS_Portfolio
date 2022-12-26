//
//  QuickFocusHeaderView.swift
//  HeadSpaceFocus
//
//  Created by 우주형 on 2022/12/27.
//

import UIKit

class QuickFocusHeaderView: UICollectionReusableView {        
    @IBOutlet weak var titleLabel: UILabel!
    func configure(_ title: String) {
        titleLabel.text = title
    }
}

