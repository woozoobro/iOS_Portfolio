//
//  FrameworkListViewController.swift
//  AppleFrameworkList
//
//  Created by 우주형 on 2022/12/25.
//

import UIKit
import Combine

class FrameworkListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    enum Section { case main }
    typealias Item = AppleFramework
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    // Combine
    var subscriptions = Set<AnyCancellable>()
    let didSelect = PassthroughSubject<AppleFramework, Never>()
    let items = CurrentValueSubject<[AppleFramework], Never>(AppleFramework.list)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.title = "DiffableDataSource"
        
        configureCollectionView()
        bind()
    }
    
    private func bind() {
        //input
        didSelect
            .receive(on: RunLoop.main)
            .sink {[unowned self] framework in
            let sb = UIStoryboard(name: "Detail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
                vc.framework.send(framework)
            self.present(vc, animated: true)
        }.store(in: &subscriptions)
        
        //output
        items
            .receive(on: RunLoop.main)
            .sink { [unowned self] items in
                self.applySectionItems(items)
            }.store(in: &subscriptions)
    }
    
    private func applySectionItems(_ items: [AppleFramework], to section: Section = .main ) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([section])
        snapshot.appendItems(items, toSection: section)
        dataSource.apply(snapshot)
    }
    
    private func configureCollectionView() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else { return nil }
            cell.configure(item)
            return cell
        })
        
        collectionView.collectionViewLayout = layout()
        collectionView.delegate = self
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.46))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 16, trailing: 0)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = items.value[indexPath.item]
        didSelect.send(framework)
    }
}
