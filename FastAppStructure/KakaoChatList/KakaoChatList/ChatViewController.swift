//
//  ViewController.swift
//  KakaoChatList
//
//  Created by 우주형 on 2022/12/25.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var chatList: [ChatModel] = ChatModel.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        chatList = chatList.sorted { $0.date > $1.date }
    }
}

extension ChatViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatCell", for: indexPath) as? ChatCell else { return UICollectionViewCell() }
        cell.configure(chatList[indexPath.item])
        
        return cell
    }
}

extension ChatViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 60)
    }
}
