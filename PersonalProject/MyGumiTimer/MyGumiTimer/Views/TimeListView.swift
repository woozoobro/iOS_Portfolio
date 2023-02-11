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
            Section {
                ForEach(vm.timeList) { timeModel in
                    NavigationLink {
                        Text("hoho")
                    } label: {
                        HStack {
                            Text(formattedDate(date: timeModel.date))
                            Spacer()
                            Text(timeModel.timeLabel)
                            Image(systemName: "backpack.circle")
                        }
                    }
                }
                .onDelete(perform: deleteItem)
            } header: {
                Text("공부 기록")
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("얼마나 공부했을까?")
    }
    
    func deleteItem(indexSet: IndexSet) {
        vm.timeList.remove(atOffsets: indexSet)
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
