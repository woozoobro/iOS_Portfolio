//
//  ContentView.swift
//  MVVMCoreDataReview
//
//  Created by 우주형 on 2023/02/13.
//

import SwiftUI
import CoreData

class CoreDataMVVMTestViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading CoreData. \(error)")
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
    
    func updateFruit(entity: FruitEntity) {
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
            print("Error saving data. \(error)")
        }
    }
    
}

struct CoreDataMVVMTestView: View {
    
    @StateObject var vm = CoreDataMVVMTestViewModel()
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack {
            TextField("Add Fruits...", text: $textFieldText)
                .padding()
            Button {
                guard !textFieldText.isEmpty else { return }
                vm.addFruit(text: textFieldText)
                textFieldText = ""
            } label: {
                Text("Save")
            }

            List {
                ForEach(vm.savedEntities) { entity in
                    Text(entity.name ?? "No Fruits")
                        .onTapGesture {
                            vm.updateFruit(entity: entity)
                        }
                }
                .onDelete(perform: vm.deleteFruit)
            }
        }
    }
}

struct CoreDataMVVMTestView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataMVVMTestView()
    }
}
