//
//  ListBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/16.
//

import SwiftUI

//struct ListBootcamp: View {
//
//    @State var fruits: [String] = [
//        "apple", "orange", "banana", "peach"
//    ]
//    @State var veggies: [String] = [
//        "tomato", "potato", "carrot"
//    ]
//    var body: some View {
//        NavigationView {
//            List {
//                Section {
//                    ForEach(fruits, id: \.self) { fruit in
//                        Text(fruit.capitalized)
//                            .font(.caption)
//                            .foregroundColor(.white)
//                            //.frame(maxWidth: .infinity, maxHeight: .infinity)
//                            //.background(.green)
//                    }
//                    .onDelete(perform: delete)
//                    .onMove(perform: move)
//                    .listRowBackground(Color.blue)
//                } header: {
//                    Label("Fruits", systemImage: "flame.fill")
//                        .font(.headline)
//                        .foregroundColor(.red)
//                }
//
//                Section() {
//                    ForEach(veggies, id: \.self) { veggie in
//                        Text(veggie.capitalized)
//                    }
//                } header: {
//                    Text("Veggies")
//                        .foregroundColor(.red)
//                }
//
//                Button("Check") {
//                    print(fruits)
//                }
//            }
//            .listStyle(SidebarListStyle())
//            .navigationTitle("Grocery List")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    EditButton()
//                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    addButton
//                }
//            }
//            .tint(.red)
//        }
//    }
//
//
//    func delete(_ indexSet: IndexSet) {
//        fruits.remove(atOffsets: indexSet)
//    }
//    func move(indexSet: IndexSet, newOffset: Int) {
//        fruits.move(fromOffsets: indexSet, toOffset: newOffset)
//    }
//
//    var addButton: some View {
//        Button("Add") {
//            fruits.append("Coconut")
//        }
//    }
//    func add() {
//        fruits.append("Coconut")
//    }
//}


struct ListBootcamp: View {
    
    @State var fruits: [String] = [
        "apple", "apple", "banana", "peach"
    ]
    @State var veggies: [String] = [
        "tomato", "potato", "carrot"
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit)
                            .foregroundColor(.white)
                            .padding(.vertical)
//                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                            .background(.pink)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                    .listRowBackground(Color.green)
                    
                } header: {
                    HStack {
                        Text("Fruits")
                        Image(systemName: "flame.fill")
                    }
                    .font(.headline)
                    .foregroundColor(.purple)
                }
                
                Section {
                    ForEach(veggies, id: \.self) { veggie in
                        Text(veggie.capitalized)
                    }
                } header: {
                    Text("Veggies")
                }
            }
//            .listStyle(.grouped)
            .navigationTitle("Grocery List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    addButton
                }
            }
        }
        .tint(.red)
    }
    
    var addButton: some View {
        Button {
            add()
        } label: {
            Text("Add")
        }
    }
    
    func add() {
        fruits.append("Coconut")
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func move(indexSet: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indexSet, toOffset: newOffset)
    }
   
}





struct ListBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListBootcamp()
    }
}
