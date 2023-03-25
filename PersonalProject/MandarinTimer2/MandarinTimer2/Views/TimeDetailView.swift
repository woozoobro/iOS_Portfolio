//
//  TimeDetailView.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/19.
//

import SwiftUI

struct TimeDetailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: TimerViewModel
    let dayKey: String
    
    var body: some View {
        List {
            ForEach(vm.dayTimeList) { time in
                VStack(alignment: .leading) {
                    HStack {
                        Text(time.studySeconds.countToTimeLabel())
                        Text("공부함")
                    }
                    .font(.title2)
                    ZStack {
                        if time.breakSeconds != 0 {
                            Text(time.breakSeconds.countToTimeLabel() + "휴식함")
                        }
                    }
                }
            }
            .onDelete(perform: vm.delteTime)
        }
        .listStyle(.grouped)
//        .navigationTitle(time.allDate)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    vm.deleteAllTimes(key: dayKey)
                    dismiss()
                } label: {
                    Image(systemName: "trash")
                }
            }
        }
        .onAppear {
            print("On Appeared Detail View")
            vm.getDateTimeList(key: dayKey)
        }
    }
}


struct TimeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimeDetailView(dayKey: dev.timeModel.dailyIdentifier)
        }
        .environmentObject(dev.timerVM)
    }
}
