//
//  ContentView.swift
//  CoreDataFruit
//
//  Created by 우주형 on 2023/02/14.
//

import SwiftUI
import CoreData

class CoreDataFruitViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func updateItem(entity: FruitEntity) {
        let currentName = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("Error saving Data. \(error)")
        }
    }
    
}


struct CoreDataFruitView: View {
    
    @StateObject var vm = CoreDataFruitViewModel()
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack {
            TextField("Add fruit", text: $textFieldText)
                .padding()
                .frame(height: 55)
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button {
                guard !textFieldText.isEmpty else { return }
                vm.addFruit(text: textFieldText)
                textFieldText = ""
            } label: {
                Text("Save")
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }

            List {
                ForEach(vm.savedEntities) { entity in
                    Text(entity.name ?? "error")
                        .onTapGesture {
                            vm.updateItem(entity: entity)
                        }
                }
                .onDelete(perform: vm.deleteFruit)
            }
            
            Spacer()
        }
        .padding(.top)
        .navigationTitle("Fruit CoreData")
    }
}

struct CoreDataFruitView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CoreDataFruitView()
        }
    }
}
