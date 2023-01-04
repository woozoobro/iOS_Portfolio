//
//  DetailViewModel.swift
//  CarrotHomeTab
//
//  Created by 우주형 on 2023/01/05.
//

import Foundation
import Combine

final class DetailViewModel {
    
    let network: NetworkService
    let iteminfo: ItemInfo
    
    @Published var itemInfoDetails: ItemInfoDetails? = nil
    
    init(network: NetworkService, iteminfo: ItemInfo) {
        self.network = network
        self.iteminfo = iteminfo
    }
    
    func fetch() {
        // 네트워크 느낌 구현 일부러 느리게 로드되게함
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.2) { [unowned self] in
            self.itemInfoDetails = ItemInfoDetails(user: User.mock, item: self.iteminfo, details: ItemExtraInfo.mock)
        }
    }
    
}
