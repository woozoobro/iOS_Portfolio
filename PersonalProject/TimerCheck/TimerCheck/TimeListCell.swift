//
//  TimeListCell.swift
//  TimerCheck
//
//  Created by 우주형 on 2023/01/11.
//

import UIKit

class TimeListCell: UICollectionViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    func configure(_ item: TimeModel) {
        timeLabel.text = "\(item.seconds)"
    }
    
}
