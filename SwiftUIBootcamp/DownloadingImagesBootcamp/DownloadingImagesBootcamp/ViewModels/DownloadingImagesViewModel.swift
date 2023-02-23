//
//  DownloadingImagesViewModel.swift
//  DownloadingImagesBootcamp
//
//  Created by 우주형 on 2023/02/23.
//

import Foundation
import Combine

class DownloadingImagesViewModel: ObservableObject {
    @Published var dataArray: [PhotoModel] = []
    let dataServcie = PhotoModelDataService.instance
    var cancellables = Set<AnyCancellable>()
        
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataServcie.$photoModels
            .receive(on: DispatchQueue.main)
            .sink { [weak self] returnedPhotoModels in
                self?.dataArray = returnedPhotoModels
            }
            .store(in: &cancellables)
    }
    
}
