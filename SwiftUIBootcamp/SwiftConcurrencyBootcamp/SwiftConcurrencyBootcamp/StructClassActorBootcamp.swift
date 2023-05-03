//
//  StructClassActorBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by 우주형 on 2023/05/03.
//

import SwiftUI

struct StructClassActorBootcamp: View {
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                structTest1()
            }
    }
}

struct MyStruct {
    var title: String
}

extension StructClassActorBootcamp {
    private func runTest() {
        print("Test started!")
    }
    
    private func structTest1() {
        let objectA = MyStruct(title: "Starting title!")
        print("ObjectA: ", objectA.title)
        
        print("Pass the VALUES of objectA to objectB.")
        var objectB = objectA
        print("ObjectB: ", objectB.title)
        
        objectB.title = "Second title!"
        print("ObjectB title changed.")
        
        print("ObjectA: ", objectA.title)
        print("ObjectB: ", objectB.title)
    }
}

struct StructClassActorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StructClassActorBootcamp()
    }
}
