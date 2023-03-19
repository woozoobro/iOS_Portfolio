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
            Text(time.allDate)
                .font(.title)
            HStack {
                Text(time.passedTime)
                Text("공부함")
            }
            .font(.largeTitle)
        }
        .navigationBarTitleDisplayMode(.inline)
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
            TimeDetailView(time: TimeModel(fullDate: "2023-04-01 00:01:01", passedTime: "2시간"))
        }
        .environmentObject(TimerViewModel())
    }
}
