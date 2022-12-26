//
//  QuickFocusCell.swift
//  HeadSpaceFocus
//
//  Created by 우주형 on 2022/12/27.
//

import UIKit

class QuickFocusCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(_ item: QuickFocus ) {
        imageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.title
        descriptionLabel.text = item.description
    }
}
