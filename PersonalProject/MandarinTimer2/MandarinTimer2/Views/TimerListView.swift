//
//  TimerListView.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/19.
//

import SwiftUI

struct TimerListView: View {
    @EnvironmentObject var vm: TimerViewModel
    private let columns: [GridItem] = [
        GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(vm.sectionKeys, id: \.self) { key in
                    Section {
                        ForEach(vm.getSectionTimeData(key: key)) { item in
                            NavigationLink {
                                TimeDetailView(time: item)
                            } label: {
                                TimeCell(time: item)
                            }
                            .tint(.primary)
                        }
                        .padding(.bottom)
                    } header: {
                        HStack {
                            Text(key.formatSectionTitle())
                                .font(.title2)
                                .padding(.all, 10)
                                .background { Color.orange.opacity(0.3).cornerRadius(20) }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Divider()
                    }
                }
            }
        }
        .navigationTitle("타임 리스트")
    }
}


struct TimerListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimerListView()
                .environmentObject(dev.timerVM)
        }
    }
}
