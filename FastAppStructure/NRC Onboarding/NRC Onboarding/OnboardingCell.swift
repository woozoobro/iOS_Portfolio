//
//  OnboardingCell.swift
//  NRC Onboarding
//
//  Created by 우주형 on 2022/12/25.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(_ message: OnboardingMessage) {
        titleLabel.text = message.title
        descriptionLabel.text = message.description
        titleImageView.image = UIImage(named: message.imageName)
    }
    
}
