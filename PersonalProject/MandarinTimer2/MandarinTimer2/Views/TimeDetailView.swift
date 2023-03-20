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
    let time: TimeModel
    
    var body: some View {
        VStack {
            HStack {
                Text(time.studySeconds.countToTimeLabel())
                Text("공부함")
            }
            .font(.largeTitle)
            ZStack {
                if time.breakSeconds != 0 {
                    Text(time.breakSeconds.countToTimeLabel() + "휴식함")
                }
            }
        }
        .navigationTitle(time.allDate)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    vm.deleteTime(item: time)
                    dismiss()
                } label: {
                    Image(systemName: "trash")
                }
            }
        }
    }
}

struct TimeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimeDetailView(time: dev.timeModel)
        }
        .environmentObject(dev.timerVM)
    }
}
