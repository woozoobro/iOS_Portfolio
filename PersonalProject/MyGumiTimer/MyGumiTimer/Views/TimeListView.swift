//
//  TimeListView.swift
//  MyGumiTimer
//
//  Created by 우주형 on 2023/01/30.
//

import SwiftUI

struct TimeListView: View {
    
    @ObservedObject var vm: CountTimeViewModel
    
    var body: some View {
        List {
            ForEach(vm.timeList) { timeModel in
                Section {
                    ForEach(vm.timeList) { timeModel in
                        NavigationLink {
                            Text("hoho")
                        } label: {
                            HStack {
                                Text(timeModel.formattedString)
                                Spacer()
                                Text(timeModel.timeLabel)
                                Image(systemName: "backpack.circle")
                            }
                        }
                    }
                    .onDelete(perform: vm.deleteItem)
                } header: {
                    Text(timeModel.formattedSectionString)
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("얼마나 공부했을까?")
    }

}

//MARK: - DateFormat Function
extension TimeListView {
    
    private func formattedSectionDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 M월의 기록"
        
        return formatter.string(from: date)
    }
    
    private func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 hh시 mm분"
        
        return formatter.string(from: date)
    }
}

//MARK: - Preview
struct TimeListView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            TimeListView(vm: CountTimeViewModel())
        }
    }
}
