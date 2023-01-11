//
//  TimeTableViewCell.swift
//  TimerCheck
//
//  Created by 우주형 on 2023/01/12.
//

import UIKit

class TimeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    func configure(_ item: TimeModel) {
        timeLabel.text = "\(item.seconds) 초"
        dateLabel.text = dateToString(date: item.date)
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }

}
