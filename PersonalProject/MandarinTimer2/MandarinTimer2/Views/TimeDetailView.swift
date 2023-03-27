//
//  TimeDetailView.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/19.
//

import SwiftUI

struct TimeDetailView: View {    
    @EnvironmentObject var vm: TimerViewModel
    @State var showAlert: Bool = false
    let dayKey: String
    
    var body: some View {
        ZStack {
            Color.orange.opacity(0.14)
                .ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 10)
                timeListSection
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showAlert.toggle()
                } label: {
                    Image(systemName: "trash")
                }
                .tint(.primary)
            }
        }
        .onAppear {
            print("On Appeared Detail View")
            vm.getDateTimeList(key: dayKey)
        }
    }
}

extension TimeDetailView {
    private var timeListSection: some View {
        List {
            ForEach(vm.dayTimeList) { time in
                HStack {
                    HStack {
                        Text(time.studySeconds.countToTimeLabel())
                        Text("공부함")
                    }
                    .font(.title2)
                    Spacer()
                    ZStack {
                        if time.breakSeconds != 0 {
                            Text(time.breakSeconds.countToTimeLabel() + " 휴식함")
                        }
                    }
                }
            }
            .onDelete(perform: vm.delteTime)
        }
        .confirmationDialog("삭제할까요?", isPresented: $showAlert, titleVisibility: .visible, actions: {
            Button("삭제", role: .destructive) {
                vm.deleteAllTimes(key: dayKey)
            }
            
            Button("취소", role: .cancel) {
                showAlert = false
            }
        }, message: {
            Text("해당 날짜의 모든 내용이 삭제될거에요.\n개별적인 내용을 삭제하고 싶다면 스와이프로 지울 수 있어요!")
        })
        .listStyle(.plain)
        .navigationTitle(dayKey.formatDayTitle())
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
