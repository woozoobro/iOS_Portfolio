//
//  StockCell.swift
//  StockList
//
//  Created by 우주형 on 2022/12/24.
//

import UIKit

class StockCell: UICollectionViewCell {
            
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var stockImage: UIImageView!
    @IBOutlet weak var stockName: UILabel!
    @IBOutlet weak var stockPrice: UILabel!
    @IBOutlet weak var stockDiff: UILabel!
    
    func configure(_ stock: StockModel) {
        rankLabel.text = "\(stock.rank)"
        stockImage.image = UIImage(named: stock.imageName)
        stockName.text = stock.name
        stockPrice.text = "\(convertToCurrencyFormat(price: stock.price)) 원"
        stockDiff.text = "\(stock.diff)&"
        stockDiff.textColor = stock.diff > 0 ? .red : .blue
    }
    
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price))!
        return result
    }
}
