//
//  FrameworkListViewModel.swift
//  AppleFramework_SwiftUI
//
//  Created by 우주형 on 2023/01/03.
//

import Foundation

final class FrameworkListViewModel: ObservableObject {
    @Published var models: [AppleFramework] = AppleFramework.list
    @Published var isShowingDetail: Bool = false
    @Published var selectedItem: AppleFramework?
}
