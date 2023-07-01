//
//  ContentView.swift
//  NavigationDestinationBindingTest
//
//  Created by 우주형 on 2023/06/30.
//

import SwiftUI

final class ParentListViewModel: ObservableObject {
    @Published var numberItems = [NumberItem(number: 1), NumberItem(number: 2), NumberItem(number: 3), NumberItem(number: 4), NumberItem(number: 5)]
}

struct NumberItem: Identifiable {
    let id = UUID().uuidString
    var number: Int
}

struct ParentListView: View {
    @StateObject private var vm = ParentListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.numberItems) { numberItem in
                    NavigationLink(value: numberItem.id) {
                        Text("\(numberItem.number)")
                    }
                }
            }
            .navigationDestination(for: String.self) { numberItemID in
                ChildDetailView(numberItems: $vm.numberItems, numberItemID: numberItemID)
            }
        }
    }
}

struct ChildDetailView: View {
    @Binding var numberItems: [NumberItem]
    let numberItemID: String
    
    var body: some View {
        ChildDetailView2(numberItem: binding(for: numberItemID))
    }
    
    private func binding(for numberItemID: String) -> Binding<NumberItem> {
        guard let index = numberItems.firstIndex(where: {$0.id == numberItemID}) else {
            fatalError("Can't find item in array")
        }
        return $numberItems[index]
    }
}

struct ChildDetailView2: View {
    @Binding var numberItem: NumberItem
    var body: some View {
        VStack {
            Text("\(numberItem.number)")
            Button {
                numberItem.number += 10
            } label: {
                Text("Add 10")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentListView()
    }
}
