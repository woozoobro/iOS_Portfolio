//
//  DownloadingImagesViewModel.swift
//  DownloadingImages
//
//  Created by 우주형 on 2023/02/23.
//

import Foundation
import Combine

class DownloadingImagesViewModel: ObservableObject {
    @Published var dataArray: [PhotoModel] = []
    let dataService = PhotoModelDataService.instance
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscriber()
    }
    
    func addSubscriber() {
        dataService.$photoModels
            .sink { [weak self] returnedPhotoModels in
                self?.dataArray = returnedPhotoModels
            }
            .store(in: &cancellables)
    }
    
}
