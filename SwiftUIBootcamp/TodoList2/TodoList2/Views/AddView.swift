//
//  AddView.swift
//  TodoList2
//
//  Created by 우주형 on 2023/02/12.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("메모를 추가해요...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.15))
                .cornerRadius(10)
                
                Button {
                    
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

            }
            .padding(16)
        }
        .navigationTitle("메모 추가🖊️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
