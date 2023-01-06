//
//  DiaryCell.swift
//  Diary
//
//  Created by 우주형 on 2023/01/06.
//

import UIKit

class DiaryCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        contentView.layer.cornerRadius = 10
//        contentView.layer.borderWidth = 2
//        contentView.layer.borderColor = UIColor.black.cgColor
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.black.cgColor
    }
}

