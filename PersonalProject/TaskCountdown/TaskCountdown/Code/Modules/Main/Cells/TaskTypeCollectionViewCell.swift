//
//  TaskTypeCollectionViewCell.swift
//  TaskCountdown
//
//  Created by 우주형 on 2022/12/30.
//

import UIKit

class TaskTypeCollectionViewCell: UICollectionViewCell {

    //MARK: - outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageContainerView: UIView!
    
    @IBOutlet weak var typeName: UILabel!
    
    //MARK: - variables
    
    
    
    
    //MARK: - lifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        DispatchQueue.main.async {
            self.imageContainerView.layer.cornerRadius = self.imageContainerView.bounds.width / 2
        }
    }

    
    //MARK: - functions
    override class func description() -> String {
        return "TaskTypeCollectionViewCell"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
    
    func setupCell(taskType: TaskType, isSelected: Bool) {
        self.typeName.text = taskType.typeName
        if (isSelected) {
            self.imageContainerView.backgroundColor = UIColor(hex: "17b890").withAlphaComponent(0.5)
            self.typeName.textColor = UIColor(hex: "006666")
            self.imageView.tintColor = UIColor.white
            self.imageView.image = UIImage(systemName: taskType.symbolName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .medium))
        } else {
            self.imageView.image = UIImage(systemName: taskType.symbolName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 22, weight: .regular))
            reset()
        }
    }
    
    func reset() {
        self.imageContainerView.backgroundColor = UIColor.clear
        self.typeName.textColor = UIColor.black
        self.imageView.tintColor = UIColor.black
    }
    
}
