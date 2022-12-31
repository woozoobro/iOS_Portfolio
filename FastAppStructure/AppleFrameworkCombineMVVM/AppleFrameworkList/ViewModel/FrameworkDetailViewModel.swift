//
//  FrameworkDetailViewModel.swift
//  AppleFrameworkList
//
//  Created by 우주형 on 2022/12/31.
//

import Foundation
import Combine

final class FrameworkDetailViewModel {
        
    init(framework: AppleFramework) {
        self.framework = CurrentValueSubject(framework)
    }
    
    // Data => Output
    let framework: CurrentValueSubject<AppleFramework, Never>
        
    // User Action => Input
    let buttonTapped = PassthroughSubject<AppleFramework, Never>()
    
    func learnMoreTapped() {
        buttonTapped.send(framework.value)
    }    
}
