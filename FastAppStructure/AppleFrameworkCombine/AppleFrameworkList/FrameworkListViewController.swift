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
        
    //Combine
    var subscriptions = Set<AnyCancellable>()
    let didSelect = PassthroughSubject<AppleFramework, Never>()
    let items = CurrentValueSubject<[AppleFramework], Never>(AppleFramework.list)
    
    enum Section { case main }
    typealias Item = AppleFramework
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.title = "DiffableDataSource"
        
        configureCollectionView()
        bind()

    }
    
    private func bind() {
        // input: 사용자 인풋을 받아서, 처리해야 할 것
        // - item 선택 되었을 때 처리
        didSelect
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
            let sb = UIStoryboard(name: "Detail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
            vc.framework = framework
            self.present(vc, animated: true)
        }.store(in: &subscriptions)
        
        // output: data, state 변경에 따라서 UI업데이트 할 것
        // - items 가 세팅이 되었을 때 컬렉션 뷰를 업데이트
        items
            .receive(on: RunLoop.main)
            .sink { [unowned self] list in
                self.applySectionItems(list)
        }.store(in: &subscriptions)
    }
    
    private func applySectionItems(_ items: [Item], to section: Section = .main) {
        // data
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
        // layer
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
