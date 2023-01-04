//
//  MainTabBarController.swift
//  CarrotHomeTab
//
//  Created by 우주형 on 2023/01/04.
//

import UIKit

// 탭이 눌릴때마다, 그에 맞는 네비게이션 바를 구성하고 싶다
// - 탭이 눌리는 것을 감지해야겠다
// - 탭이 감지후에, 그 탭에 맞게 네비게이션 바 구성을 업뎃 해줘야겠다

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateNavigationItem(vc: self.selectedViewController!)
    }
    
    private func updateNavigationItem(vc: UIViewController) {
        switch vc {
        case is HomeViewController:
            let titleConfig = CustomBarItemConfiguration(title: "정자동", handler: {})
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            let searchConfig = CustomBarItemConfiguration(title: nil, image: UIImage(systemName: "magnifyingglass"), handler: {print("search Tapped")})
            let searchItem = UIBarButtonItem.generate(with: searchConfig, width: 30)
            
            let feedConfig = CustomBarItemConfiguration(title: nil, image: UIImage(systemName: "bell"), handler: {print("feed Tapped")})
            let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem, searchItem]
            navigationItem.backButtonDisplayMode = .minimal
            
        case is MyTownViewController:
            let titleConfig = CustomBarItemConfiguration(title: "정자동", handler: {})
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            let feedConfig = CustomBarItemConfiguration(title: nil, image: UIImage(systemName: "bell"), handler: {print("feed Tapped")})
            let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem]
            navigationItem.backButtonDisplayMode = .minimal
        case is ChatViewController:
            let titleConfig = CustomBarItemConfiguration(title: "채팅", handler: {})
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            let feedConfig = CustomBarItemConfiguration(title: nil, image: UIImage(systemName: "bell"), handler: {print("feed Tapped")})
            let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem]
            navigationItem.backButtonDisplayMode = .minimal
        case is MyProfileViewController:
            let titleConfig = CustomBarItemConfiguration(title: "나의 당근", handler: {})
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            let settingConfig = CustomBarItemConfiguration(title: nil, image: UIImage(systemName: "gearshape"), handler: {print("setting Tapped")})
            let settingItem = UIBarButtonItem.generate(with: settingConfig, width: 30)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [settingItem]
            navigationItem.backButtonDisplayMode = .minimal
        default:
            let titleConfig = CustomBarItemConfiguration(title: "정자동", handler: {})
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = []
            navigationItem.backButtonDisplayMode = .minimal
        }
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("---> 어떤 vc: \(viewController)")
        updateNavigationItem(vc: viewController)
    }
}
