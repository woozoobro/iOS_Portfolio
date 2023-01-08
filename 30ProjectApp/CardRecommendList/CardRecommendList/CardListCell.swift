//
//  CardListCell.swift
//  CardRecommendList
//
//  Created by 우주형 on 2023/01/08.
//

import UIKit
import Kingfisher

class CardListCell: UITableViewCell {

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var promotionLabel: UILabel!
    @IBOutlet weak var cardNameLabel: UILabel!
    
    func configure(_ item: CreditCard) {
        rankLabel.text = "\(item.rank)"
        promotionLabel.text = "\(item.promotionDetail.amount)만원 증정"
        cardNameLabel.text = "\(item.name)"
        cardImageView.kf.setImage(with: URL(string: item.cardImageURL))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
