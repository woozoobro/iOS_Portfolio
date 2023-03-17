//
//  TimeListView.swift
//  MandarinTimer
//
//  Created by 우주형 on 2023/02/25.
//

import SwiftUI

struct TimeListView: View {
    @EnvironmentObject var vm: TimerViewModel
    private let columns: [GridItem] = [
        GridItem(.flexible()), GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(vm.keys, id: \.self) { key in
                    
                    Section {
                        
                    } header: {
                        Text(key)
                    }
                }                
            }
        }
        .navigationTitle("나의 기록")
    }
    
}

extension TimeListView {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "kor")
        return formatter
    }
}

struct TimeListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimeListView()
                .environmentObject(TimerViewModel())
        }
    }
}
