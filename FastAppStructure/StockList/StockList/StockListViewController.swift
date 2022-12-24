//
//  StockListViewController.swift
//  StockList
//
//  Created by 우주형 on 2022/12/24.
//

import UIKit

class StockListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    let stockList: [StockModel] = StockModel.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension StockListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockCell", for: indexPath) as? StockCell else { return UICollectionViewCell()}
        cell.configure(stockList[indexPath.item])
        return cell
    }
}

extension StockListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
