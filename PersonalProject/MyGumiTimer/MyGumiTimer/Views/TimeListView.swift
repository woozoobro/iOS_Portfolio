//
//  TimeListView.swift
//  MyGumiTimer
//
//  Created by 우주형 on 2023/01/30.
//

import SwiftUI

struct TimeListView: View {
    let date = Date()
    
    var body: some View {
        List {
            ForEach(0..<5) { _ in
                Section {
                    ForEach(0..<10) { _ in
                        NavigationLink {
                            Text("hoho")
                        } label: {
                            HStack {
                                Text(formattedDate(date: date))
                                Spacer()
                                Image(systemName: "moon.fill")
                            }
                        }
                    }
                } header: {
                    Text("1월의 기록")
                }
            }
            
            ForEach(0..<10) { _ in
                NavigationLink {
                    Text("hoho")
                } label: {
                    HStack {
                        Text(formattedDate(date: date))
                        Spacer()
                        Image(systemName: "moon.fill")
                    }
                }
            }
            
        }
        .listStyle(.insetGrouped)
        .navigationTitle("얼마나 공부했을까?")
    }
}

extension TimeListView {
    private func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일"
        
        return formatter.string(from: date)
    }
}

struct TimeListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimeListView()
        }
    }
}
