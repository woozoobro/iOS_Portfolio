//
//  DownloadingImageViewModel.swift
//  DownloadingImages
//
//  Created by 우주형 on 2023/02/23.
//

import Foundation
import SwiftUI
import Combine

class DownloadingImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    let urlString: String
    var cancellables = Set<AnyCancellable>()
    
    init(url: String) {
        urlString = url
        downloadImage()
    }
    
    func downloadImage() {
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
