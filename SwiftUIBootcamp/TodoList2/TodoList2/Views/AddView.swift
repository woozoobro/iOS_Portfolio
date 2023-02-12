//
//  AddView.swift
//  TodoList2
//
//  Created by 우주형 on 2023/02/12.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var vm: ListViewModel
    @State var textFieldText: String = ""
    @Environment(\.dismiss) var dismiss
    
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                TextField("메모를 입력해", text: $textFieldText)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2)).cornerRadius(10)
                    .padding(.horizontal)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("저장")
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.medium)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue).cornerRadius(10)
                        .padding(.horizontal)
                }
            }
        }
        .navigationTitle("메모를 추가하죠🖊️")
        .alert("메모가 짧은가봐요🥹", isPresented: $showAlert){ } message: {
            Text("메모를 쪼끔 더 길게 입력해보세요")
        }

    }
    
    func saveButtonPressed() {
        if isAppropriate() {
            vm.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func isAppropriate() -> Bool {
        if textFieldText.count < 2 {
            showAlert.toggle()
            return false
        }
        return true
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
