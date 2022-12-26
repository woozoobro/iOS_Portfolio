//
//  BannerCell.swift
//  SpotifyPaywall
//
//  Created by 우주형 on 2022/12/26.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 16
    }
    
    func configure(_ item: BannerInfo) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        iconImageView.image = UIImage(named: item.imageName)
    }
    
}
