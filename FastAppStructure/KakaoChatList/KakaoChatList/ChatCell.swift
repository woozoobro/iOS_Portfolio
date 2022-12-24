//
//  ChatCell.swift
//  KakaoChatList
//
//  Created by 우주형 on 2022/12/25.
//

import UIKit

class ChatCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    override func awakeFromNib() {
//        iconImage.clipsToBounds = true
        iconImage.layer.cornerRadius = 14
    }
    func configure(_ chatModel: ChatModel) {
        nameLabel.text = chatModel.name
        textLabel.text = chatModel.chatting
        dateLabel.text = chatModel.date
        iconImage.image = UIImage(named: chatModel.icon)
    }
}
