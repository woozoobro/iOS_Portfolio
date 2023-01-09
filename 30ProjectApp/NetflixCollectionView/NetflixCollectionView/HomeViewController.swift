//
//  HomeViewController.swift
//  NetflixCollectionView
//
//  Created by 우주형 on 2023/01/10.
//

import UIKit

class HomeViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //네비게이션 설정
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.hidesBarsOnSwipe = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "netflix_icon"), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: nil, action: nil)
        
    }
    
    
    
    
    
}
