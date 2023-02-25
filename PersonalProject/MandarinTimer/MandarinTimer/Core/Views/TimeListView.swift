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
                    Text(model.passedTime)
                    Text(model.startedDate.description)
                }
            }
        }
        .navigationTitle("나의 기록")
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
