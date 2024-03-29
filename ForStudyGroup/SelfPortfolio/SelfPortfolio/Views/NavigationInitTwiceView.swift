//
//  NavigationInitTwiceView.swift
//  SelfPortfolio
//
//  Created by 우주형 on 2023/03/08.
//

import SwiftUI

//MARK: - Destination View
struct DestinationView: View {
    let fruit: Fruit
    
    init(fruit: Fruit) {
        self.fruit = fruit
        print("Initializing Destination View for \(fruit.title)")
    }

    var body: some View {
        Text("What the...\(fruit.title)")
    }
}

//MARK: - Model
struct Fruit: Identifiable {
    let id = UUID().uuidString
    let title: String
}

//MARK: - ViewModel
class NavigationInitTwiceViewModel: ObservableObject {
    @Published var fruits: [Fruit] = []
    init() {
        getFruits()
    }
    
    private func getFruits() {
        fruits = [
            Fruit(title: "Apple"),
            Fruit(title: "Banana"),
            Fruit(title: "Candada"),
            Fruit(title: "Desert"),
            Fruit(title: "Eagle"),
            Fruit(title: "Fire"),
            Fruit(title: "Game"),
            Fruit(title: "Horse"),
            Fruit(title: "Import"),
            Fruit(title: "Jungle"),
            Fruit(title: "King"),
            Fruit(title: "Lion"),
            Fruit(title: "Mom"),
            Fruit(title: "No"),
            Fruit(title: "Oh my"),
            Fruit(title: "Pak"),
            Fruit(title: "Apple"),
            Fruit(title: "Banana"),
            Fruit(title: "Apple"),
            Fruit(title: "Banana"),
            Fruit(title: "Apple"),
            Fruit(title: "Banana"),
            Fruit(title: "Apple"),
            Fruit(title: "Banana"),
            Fruit(title: "Apple"),
        ]
    }
}

//MARK: - View
struct NavigationInitTwiceView: View {
//    @StateObject var vm = NavigationInitTwiceViewModel()
    @State var fruits: [Fruit] = [
        Fruit(title: "Apple"),
        Fruit(title: "Banana"),
        Fruit(title: "Candada"),
        Fruit(title: "Desert"),
        Fruit(title: "Eagle"),
        Fruit(title: "Fire"),
        Fruit(title: "Game"),
        Fruit(title: "Horse"),
        Fruit(title: "Import"),
        Fruit(title: "Jungle"),
        Fruit(title: "King"),
        Fruit(title: "Lion"),
        Fruit(title: "Mom"),
        Fruit(title: "No"),
        Fruit(title: "Oh my"),
        Fruit(title: "Pak"),
        Fruit(title: "Apple"),
        Fruit(title: "Banana"),
        Fruit(title: "Apple"),
        Fruit(title: "Banana"),
        Fruit(title: "Apple"),
        Fruit(title: "Banana"),
        Fruit(title: "Apple"),
        Fruit(title: "Banana"),
        Fruit(title: "Apple"), ]
    init() {
        print("fruits")
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits) { fruit in
                    DestinationView(fruit: fruit)

                }
            }
        }
    }
}

//MARK: - Component
/*
extension NavigationInitTwiceView {
    private var before: some View {
        List {
            ForEach(vm.fruits) { fruit in
                NavigationLink {
                    DestinationView(fruit: fruit)
                } label: {
                    Text(fruit.title)
                }
            }
        }
    }
    
    private var after: some View {
        List {
            ForEach(vm.fruits) { fruit in
                DestinationView(fruit: fruit)
            }
        }
    }
    
}

 */
struct NavigationInitTwiceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationInitTwiceView()
    }
}
