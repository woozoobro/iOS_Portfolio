//
//  DiaryListView.swift
//  EmotionDiary
//
//  Created by 우주형 on 2023/03/14.
//

import SwiftUI

struct DiaryListView: View {
    @StateObject var vm: DiaryListViewModel
    @State var isPresented: Bool = false
    
    private let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                diaryListScrollView
                
                Button {
                    isPresented.toggle()
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 30)
                        .frame(width: 80, height: 80)
                        .background {Color.blue.cornerRadius(40)}
                }
            }
            .navigationTitle("Emotion Diary")
        }
        .sheet(isPresented: $isPresented) {
            let vm = DiaryViewModel(diaries: $vm.list)
            DiaryDateInputView(vm: vm)
        }
        .onAppear {
            vm.fetch()
        }
    }
}

extension DiaryListView {
    
    private var diaryListScrollView: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(vm.keys, id: \.self) { key in
                    Section {
                        let items = vm.dic[key] ?? []
                        let orderedItems = items.sorted(by: { $0.date < $1.date })
                        ForEach(orderedItems) { item in
                            NavigationLink {
                                let vm = DiaryDetailsViewModel(diaries: $vm.list, diary: item)
                                DiaryDetailsView(vm: vm)
                            } label: {
                                MoodDiaryCell(diary: item)
                                    .frame(height: 50)
                            }
                        }
                    } header: {
                        Text(formattedSectionTitle(key))
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                    }
                    .frame(height: 60)
                    .padding()
                }
            }
        }
    }
    
    private func formattedSectionTitle(_ id: String) -> String {
        let dateComponents = id.components(separatedBy: "-")
            .compactMap { Int($0) }
        guard let year = dateComponents.first,
              let month = dateComponents.last else { return id }
        
        let calendar = Calendar(identifier: .gregorian)
        let dateComponent = DateComponents(calendar: calendar, year: year, month: month)
        let date = dateComponent.date ?? Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MMMM"
        formatter.locale = Locale(identifier: "ko")
        return formatter.string(from: date)
    }
}

struct DiaryListView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListView(vm: DiaryListViewModel(storage: MoodDiaryStorage()))
    }
}
