//
//  AddTeameeView.swift
//  TeameeMaker
//
//  Created by Swain Yun on 2023/03/25.
//

import SwiftUI

struct AdjustTeameeView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var teameeMakerViewModel: TeameeMakerViewModel
    
    @State private var teameeName: String = ""
    @State private var selectedDaysOfWeek: [String] = []
    @State private var selectedActiveTimes: [String] = []
    
    let daysOfWeek: [DaysOfWeek] = [.sun, .mon, .tue, .wed, .thu, .fri, .sat]
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var body: some View {
        ScrollView {
            Section {
                TextField("Teamee's Name", text: $teameeName)
                    .padding()
                    .background(Color.gray.opacity(0.2).cornerRadius(20))
            }
            .padding()
            
            Divider()
            LazyVGrid(columns: columns) {
                    ForEach(daysOfWeek, id: \.rawValue) { day in
                        VStack {
                            DayOfWeekSelectionView(selection: $selectedDaysOfWeek, selectedActiveTimes: $selectedActiveTimes, text: day.koreanValue)
                            Spacer()
                        }
                    }
                    
            }
            .padding()
        }
        .navigationTitle(NavigationTitleType.adjustTeameeView.navigationTitle)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    //
                } label: {
                    Text("저장하기")
                    Image(systemName: "arrow.right")
                }
                .fontWeight(.bold)
            }
        }
    }
}

struct DayOfWeekSelectionView: View {
    @State private var isSelected: Bool = false
    @Binding var selection: [String]
    @Binding var selectedActiveTimes: [String]
    var text: String
    var body: some View {
        VStack {
            Text(text)
                .font(.headline.weight(.medium))
                .padding(.vertical)
                .background(
                    Circle()
                        .fill(isSelected ? Color.accentColor : Color.gray.opacity(0.2))
                        .frame(width: 50, height: 50)
                )
                .onTapGesture {
                    isSelected.toggle()
                    
                    if isSelected {
                        selection.append(text)
                    } else {
                        if let index = selection.firstIndex(where: {$0 == text}) {
                            selection.remove(at: index)
                        }
                    }
                }
            
            
            if isSelected {
                ForEach(0..<24) { n in
                    SelectablePickerView(selectedActiveTimes: $selectedActiveTimes, content: "\(n)시")
                }
            }
            
            Spacer()
        }
        .frame(width: 30)
        .frame(maxHeight: .infinity)
    }
}

struct SelectablePickerView: View {
    @State private var isSelected: Bool = false
    @Binding var selectedActiveTimes: [String]
    
    let content: String
    
    var body: some View {
        Text(content)
            .padding(.vertical)
            .monospaced()
            .font(.headline.weight(.medium))
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(isSelected ? Color.green : Color.gray.opacity(0.2))
            )
            .onTapGesture {
                isSelected.toggle()
                
                if isSelected {
                    selectedActiveTimes.append(content)
                } else {
                    if let index = selectedActiveTimes.firstIndex(where: {$0 == content}) {
                        selectedActiveTimes.remove(at: index)
                    }
                }
            }
    }
}

struct AdjustTeameeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AdjustTeameeView()
        }
        .environmentObject(TeameeMakerViewModel())
    }
}
