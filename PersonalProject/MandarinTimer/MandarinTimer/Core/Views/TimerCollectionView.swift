//
//  TimerCollectionView.swift
//  MandarinTimer
//
//  Created by 우주형 on 2023/03/05.
//

import SwiftUI

struct TimerCollectionView: View {
    @EnvironmentObject var vm: TimerViewModel
    
    var body: some View {
        List {
            ForEach(vm.keys, id: \.self) { key in
                Section {
                    let items = vm.timeDictionary[key] ?? []
                    let orderedItems = items.sorted(by: { $0.startedDate < $1.startedDate })
                    
                    ForEach(orderedItems) { item in
                        Text(item.passedTime)
                    }
                } header: {
                    Text(key)
                        .font(.headline)
                }
            }
            .onDelete(perform: vm.deleteTime)
        }
        .navigationTitle("나의 기록")
    }
}


struct TimerCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimerCollectionView()
                .environmentObject(dev.timeVM)
        }
    }
}
