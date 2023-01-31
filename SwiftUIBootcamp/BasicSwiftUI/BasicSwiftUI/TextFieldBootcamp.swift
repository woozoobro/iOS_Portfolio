//
//  TextFieldBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/17.
//

import SwiftUI

//struct TextFieldBootcamp: View {
//    @State var textFieldText: String = ""
//    @State var dataArray: [String] = []
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("Type something here...", text: $textFieldText)
//                //.textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                    .background(.gray.opacity(0.3)).cornerRadius(10)
//                    .foregroundColor(.red)
//                    .font(.headline)
//
//                Button {
//                    if textIsAppropriate() {
//                        saveText()
//                    }
//                } label: {
//                    Text("Save".uppercased())
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(textIsAppropriate() ? .blue : .gray)
//                        .cornerRadius(10)
//                        .foregroundColor(.white)
//                        .font(.headline)
//                }
//                .disabled(!textIsAppropriate())
//
//                ForEach(dataArray, id: \.self) { data in
//                    Text(data)
//                }
//
//                Spacer()
//            }
//            .padding()
//            .navigationTitle("TextField Bootcamp")
//        }
//    }
//
//    func textIsAppropriate() -> Bool {
//        if textFieldText.count >= 3 {
//            return true
//        } else {
//            return false
//        }
//    }
//
//    func saveText() {
//        dataArray.append(textFieldText)
//        textFieldText = ""
//    }
//}

struct TextFieldBootcamp: View {
    @State var textFieldText: String = ""
    @State var dataArray: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                //.textFieldStyle(.roundedBorder)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.red)
                    .font(.headline)
                
                Button {
                    if textIsAppropriate() {
                        saveText()
                    }
                } label: {
                    Text("Save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textIsAppropriate() ?  Color.blue : Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .disabled(!textIsAppropriate())
                
                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("TextField")
        }
    }
    
    func textIsAppropriate() -> Bool {
        // check text
        if textFieldText.count >= 3 {
            return true
        }
        
        return false
    }
    
    func saveText() {
        dataArray.append(textFieldText)
        textFieldText = ""
    }
}

struct TextFieldBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBootcamp()
    }
}
