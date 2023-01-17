//
//  DocumentationBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/17.
//

import SwiftUI

struct DocumentationBootcamp: View {
    //MARK: - Properties
    
    @State var data: [String] = [
        "Apples", "Oranges", "Bananas"
    ]
    @State var showAlert: Bool = false
    //MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Hello")
                ForEach(data, id: \.self) { name in
                    Text(name)
                        .font(.headline)
                }
            }.navigationTitle("Documentation Bootcamp")
                .toolbar {
                    Button("Alert") {
                        showAlert.toggle()
                    }
                }
                .alert(isPresented: $showAlert) {
                    getAlert(text: "This is the alert!")
                }
        }
    }
    //MARK: - Functions
    func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
}

//MARK: - Preview
struct DocumentationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationBootcamp()
    }
}
