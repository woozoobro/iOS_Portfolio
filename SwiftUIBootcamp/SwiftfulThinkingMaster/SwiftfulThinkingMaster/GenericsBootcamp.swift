//
//  GenericsBootcamp.swift
//  SwiftfulThinkingMaster
//
//  Created by 우주형 on 2023/03/27.
//

import SwiftUI

struct GenericModel<T> {
    let info: T?
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
    
    @Published var genericStringModel = GenericModel(info: "Hello, world")
    @Published var genericBoolModel = GenericModel(info: true)
    
    func removeData() {
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }
}

struct GenericView<T: View>: View {
    let content: T
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
            content
        }
    }
}

struct GenericsBootcamp: View {
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
            GenericView(content: Text("custom content"), title: "new View!")
            
            Circle()
                .frame(height: 100)
            Text(vm.genericStringModel.info ?? "no data")
            Text(vm.genericBoolModel.info?.description ?? "no data")
        }
        .onTapGesture {
            vm.removeData()
        }
    }
}

struct GenericsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GenericsBootcamp()
    }
}
