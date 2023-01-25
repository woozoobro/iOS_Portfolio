//
//  AddView.swift
//  MemoTwice
//
//  Created by 우주형 on 2023/01/25.
//

import SwiftUI

struct AddView: View {
    @FocusState private var focusedTextField: Bool
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(10)
                    .focused($focusedTextField)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("SAVE")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor).cornerRadius(10)
                }
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊️")
        .alert(isPresented: $showAlert, content: getAlert)
        .onAppear { focusedTextField = true }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        } 
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 2 {
            alertTitle = "Your new todo items must be at least 1 characters"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
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
