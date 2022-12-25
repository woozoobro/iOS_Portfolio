//
//  FrameworkCell.swift
//  AppleFrameworkList
//
//  Created by 우주형 on 2022/12/25.
//

import UIKit

class FrameworkCell: UICollectionViewCell {

    @IBOutlet weak var iconImage: UIImageView!    
    @IBOutlet weak var appName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        appName.numberOfLines = 1
        appName.adjustsFontSizeToFitWidth = true
    }
    
    func configure(_ framework: AppleFramework) {
        iconImage.image = UIImage(named: framework.imageName)
        appName.text = framework.name
    }
}
