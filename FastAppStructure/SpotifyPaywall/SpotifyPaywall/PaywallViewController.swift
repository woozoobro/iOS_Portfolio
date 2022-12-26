//
//  ViewController.swift
//  PaywallViewController
//
//  Created by 우주형 on 2022/12/26.
//

import UIKit

class PaywallViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let bannerInfos: [BannerInfo] = BannerInfo.list
    let colors: [UIColor] = [.systemPurple, .systemOrange, .systemPink, .systemRed]
    
    
    typealias Item = BannerInfo
    enum Section { case main }
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell else { return nil }
            cell.configure(item)
            cell.backgroundColor = self.colors[indexPath.item]
            cell.layer.cornerRadius = 16
            return cell
        })
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(bannerInfos)
        dataSource.apply(snapshot)
        
        pageControl.numberOfPages = bannerInfos.count
        collectionView.collectionViewLayout = layout()
        collectionView.alwaysBounceVertical = false
        
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        section.visibleItemsInvalidationHandler = { item, offset, env in
//            print(">>> item:\(item), offset: \(offset), env:\(env)")
            let index = Int((offset.x / env.container.contentSize.width).rounded(.up))
            self.pageControl.currentPage = index
            print("\(index)")
        }

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

