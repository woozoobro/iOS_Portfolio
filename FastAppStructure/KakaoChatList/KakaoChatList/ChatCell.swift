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
        iconImage.image = UIImage(named: chatModel.icon)
        dateLabel.text = formattedDateString(dateString: chatModel.date)
    }
    
    func formattedDateString(dateString: String) -> String {
        // String -> Date -> String
        //2022-12-25 이거를 4/1로 바꾸려고함
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        // 문자열 -> date
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "M월 d일"
            //formatter.dateFormat = "M/d"
            return formatter.string(from: date)
        } else {
            return ""
        }
    }
}
