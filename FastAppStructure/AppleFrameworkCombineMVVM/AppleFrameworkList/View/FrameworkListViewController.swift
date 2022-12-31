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
    
    // var viewModel
    var viewModel: FrameworkListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = FrameworkListViewModel(items: AppleFramework.list)
        
        navigationController?.navigationBar.topItem?.title = "DiffableDataSource"
        configureCollectionView()
        bind()
    }
    
    private func bind() {
        viewModel.items
            .receive(on: RunLoop.main)
            .sink { [unowned self] items in
                self.applySectionItems(items)
            }.store(in: &subscriptions)
        
        viewModel.selectedItem
            .compactMap{ $0 }
            .receive(on: RunLoop.main)
            .sink { framework in
                let sb = UIStoryboard(name: "Detail", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
                vc.viewModel = FrameworkDetailViewModel(framework: framework)
                self.present(vc, animated: true)
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
        viewModel.didSelect(at: indexPath)
    }
}
