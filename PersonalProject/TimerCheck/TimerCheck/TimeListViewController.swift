//
//  TimeListViewController.swift
//  TimerCheck
//
//  Created by 우주형 on 2023/01/11.
//

import UIKit
import CoreData

class TimeListViewController: UIViewController {
    
    var list = [TimeModel]()
    var timeItem = [TimeItem]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    enum Section { case main }
    typealias Item = TimeModel
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        
        loadItems()
        guard let timeVC = tabBarController?.viewControllers?[0] as? TimeViewController else { return }
        timeVC.delegate = self
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeListCell", for: indexPath) as? TimeListCell else { return nil }
            cell.configure(item)
            
            
            return cell
        })
        
        updateList()
        
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        collectionView.collectionViewLayout = layout
    }
    
    private func updateList() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list)
        dataSource.apply(snapshot)
    }
    
//    private func layout() -> UICollectionViewCompositionalLayout {
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
//        let section = NSCollectionLayoutSection(group: group)
//        return UICollectionViewCompositionalLayout(section: section)
//    }
    
    private func loadItems() {
        let request: NSFetchRequest<TimeItem> = TimeItem.fetchRequest()
        do {
            timeItem = try context.fetch(request)
            list = timeItem.map { TimeModel(seconds: Int($0.seconds ?? "0") ?? 0, minutes: Int($0.minutes ?? "0") ?? 0, hours: Int($0.hours ?? "0") ?? 0, date: $0.date!) }
        } catch {
            print("Error fetching data from context \(error)")
        }
    }
}
//MARK: - TimeVC Delegate
extension TimeListViewController: TimeViewControllerDelegate {
    func didSavedTime(data: TimeModel) {
        list.append(data)
        updateList()
    }
}

extension TimeListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(list[indexPath.item])
    }
}
