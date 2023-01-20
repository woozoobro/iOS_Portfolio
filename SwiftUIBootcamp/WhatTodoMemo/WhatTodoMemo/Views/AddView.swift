//
//  AddView.swift
//  WhatTodoMemo
//
//  Created by 우주형 on 2023/01/20.
//

import SwiftUI

struct AddView: View {
    
    @FocusState private var focusedTextField: Bool
    @State var textFieldText: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("메모를 입력해주세요", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.3)).cornerRadius(10)
                    .focused($focusedTextField)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("저장")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor).cornerRadius(10)
                }
            }
            .padding(16)
        }
        .navigationTitle("메모 추가")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
        .onAppear {
            focusedTextField = true
        }
    }
    
    func saveButtonPressed() {
        if textFieldAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func getAlert() -> Alert {        
        return Alert(title: Text(alertTitle))
    }
    
    func textFieldAppropriate() -> Bool {
        if textFieldText.count < 2 {
            alertTitle = "글자를 더 입력해주세요😉"
            showAlert.toggle()
            return false
        } else {
            return true
        }
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
