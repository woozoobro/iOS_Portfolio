//
//  TimeListViewController.swift
//  TimerCheck
//
//  Created by 우주형 on 2023/01/11.
//

import UIKit
import CoreData

class TimeListViewController: UIViewController {

//    var list = [TimeModel]()
    var timeItem = [TimeItem]()

    @IBOutlet weak var collectionView: UICollectionView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    enum Section { case main }
    typealias Item = TimeItem
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let timeVC = tabBarController?.viewControllers?[0] as? TimeViewController else { return }
        timeVC.delegate = self
        collectionView.delegate = self
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeListCell", for: indexPath) as? TimeListCell else { return UICollectionViewCell() }
            cell.configure(item)
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(timeItem)
        dataSource.apply(snapshot)
        
        collectionView.collectionViewLayout = layout()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func loadItems() {
        let request: NSFetchRequest<TimeItem> = TimeItem.fetchRequest()
        do {
            timeItem = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
    }
}
//MARK: - TimeVC Delegate
extension TimeListViewController: TimeViewControllerDelegate {
    func didSavedTime(data: TimeModel) {        
        list.append(data)
        var snapshot = dataSource.snapshot()
        snapshot.appendItems([data], toSection: .main)
        dataSource.apply(snapshot)
    }
}
//MARK: -
extension TimeListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(list[indexPath.item])
    }
}
