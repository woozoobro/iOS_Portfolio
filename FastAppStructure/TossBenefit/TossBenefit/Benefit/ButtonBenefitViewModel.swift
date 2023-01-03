//
//  ButtonBenefitViewModel.swift
//  TossBenefit
//
//  Created by 우주형 on 2023/01/04.
//

import Foundation

final class ButtonBenefitViewModel {
    
    @Published var benefit: Benefit
    @Published var benefitDetails: BenefitDetails?
    
    init(benefit: Benefit) {
        self.benefit = benefit
    }
    
    func fetchDetails() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.benefitDetails = .default
        }
    }
    
    
}
