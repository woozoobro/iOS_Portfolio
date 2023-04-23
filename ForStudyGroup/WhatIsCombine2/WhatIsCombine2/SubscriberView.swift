//
//  SubscriberView.swift
//  WhatIsCombine2
//
//  Created by 우주형 on 2023/04/22.
//

import SwiftUI
import Combine

class SubscriberViewModel: ObservableObject {
    @Published var count: Int = 0
    
    //var timer: AnyCancellable?
    var cancellables = Set<AnyCancellable>()
    
    init() {
        setUpTimer()
    }
    
    func setUpTimer() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.count += 1
                
                if let count = self?.count, count >= 5 {
                    self?.cancellables.forEach({ cancellable in
                        cancellable.cancel()
                    })
                }
            }
            .store(in: &cancellables)
    }
    
}

struct SubscriberView: View {
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        Text("\(vm.count)")
            .font(.largeTitle)
    }
}

struct SubscriberView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriberView()
    }
}
