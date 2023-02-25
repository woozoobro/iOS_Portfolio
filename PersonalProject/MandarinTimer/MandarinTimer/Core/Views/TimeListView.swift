//
//  TimeListView.swift
//  MandarinTimer
//
//  Created by 우주형 on 2023/02/25.
//

import SwiftUI

struct TimeListView: View {
    @EnvironmentObject var vm: TimerViewModel
    
    var body: some View {
        List {
            ForEach(vm.timeList) { model in
                VStack {
                    Text(dateFormatter.string(from: model.startedDate))
                    Text(model.passedTime)
                }
            }
            .onDelete(perform: vm.deleteTime)
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
