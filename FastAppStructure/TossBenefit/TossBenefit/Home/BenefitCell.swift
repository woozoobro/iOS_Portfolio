//
//  BenefitCell.swift
//  TossBenefit
//
//  Created by 우주형 on 2023/01/03.
//

import UIKit

class BenefitCell: UICollectionViewCell {
        
    @IBOutlet weak var benefitImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(item: Benefit) {
        benefitImage.image = UIImage(named: item.imageName)
        descriptionLabel.text = item.description
        titleLabel.text = item.title
    }
    
}
