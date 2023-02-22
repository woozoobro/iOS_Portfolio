//
//  PhotoModelCacheManager.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 우주형 on 2023/02/22.
//

import Foundation
import SwiftUI

class PhotoModelCacheManager {
    static let instance = PhotoModelCacheManager()
    private init() { }
    
    var photoCache: NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 20
        cache.totalCostLimit = 1024 * 1024 * 200  // 200mb Maybe...?
        return cache
    }()
    
    func add(key: String, value: UIImage) {
        
    }
}
