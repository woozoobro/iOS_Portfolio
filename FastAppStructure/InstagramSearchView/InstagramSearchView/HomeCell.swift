//
//  HomeCell.swift
//  InstagramSearchView
//
//  Created by 우주형 on 2022/12/25.
//

import UIKit

class HomeCell: UICollectionViewCell {
        
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImage.image = nil
    }

    func configure(_ imageName: String) {
        thumbnailImage.image = UIImage(named: imageName)
    }
}
