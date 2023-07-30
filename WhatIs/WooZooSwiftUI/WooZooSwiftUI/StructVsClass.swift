//
//  StructVsClass.swift
//  WooZooSwiftUI
//
//  Created by 우주형 on 2023/07/17.
//

import SwiftUI

//struct MyStruct {
//    var title: String
//}

class MyClass {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
}

struct StructVsClass: View {
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                runTest()
                classTest1()
            }
    }
}


extension StructVsClass {
    private func runTest() {
        print("Test started!")
    }
    
    private func classTest1() {
        let objectA = MyClass(title: "Starting title!")
        print("ObjectA: ", objectA.title)
                
        let objectB = objectA
        print("ObjectB: ", objectB.title)
        
        objectB.title = "Second Changed Title"
        
        print("ObjectB: ", objectB.title)
        print("ObjectA: ", objectA.title)
    }
    
//    private func structTest1() {
//        let objectA = MyStruct(title: "Starting title!")
//        print("ObjectA: ", objectA.title)
//
//        var objectB = objectA
//        print("ObjectB:", objectB.title)
//
//        objectB.title = "Second title!"
//        print("ObjectB:", objectB.title)
//    }
}

struct StructVsClass_Previews: PreviewProvider {
    static var previews: some View {
        StructVsClass()
    }
}
