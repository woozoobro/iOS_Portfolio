//
//  DownloadingImagesViewModel.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 우주형 on 2023/02/21.
//

import Foundation

class DownloadingImagesViewModel: ObservableObject {
    @Published var dataArray: [PhotoModel] = []
    
    let dataService = PhotoModelDataService.instance
}
