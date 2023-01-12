//
//  TimeListCell.swift
//  TimerCheck
//
//  Created by 우주형 on 2023/01/11.
//

import UIKit

class TimeListCell: UICollectionViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
//    func configure(_ item: TimeModel) {
//        timeLabel.text = "\(item.seconds) 초"
//        dateLabel.text = dateToString(date: item.date)
//    }
    
    func configureCell(with timeItem: TimeItem) {
        timeLabel.text = timeItem.seconds
        dateLabel.text = dateToString(date: timeItem.date ?? Date())
    }
    
    func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
}
