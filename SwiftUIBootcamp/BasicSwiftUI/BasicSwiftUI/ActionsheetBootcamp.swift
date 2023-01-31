//
//  ActionsheetBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/16.
//

import SwiftUI

//struct ActionsheetBootcamp: View {
//
//    @State var showActionSheet: Bool = false
//    var body: some View {
//        Button("Click me") {
//            showActionSheet.toggle()
//        }
//        .confirmationDialog("Are you sure?", isPresented: $showActionSheet) {
//            Button("Delete all Items?", role: .destructive) {
//            }
//        } message: {
//            Text("You cannot undo this action")
//        }
//    }
//}

struct ActionsheetBootcamp: View {
    @State var showActionSheet: Bool = false
    @State var actionSheetOption: ActionSheetOptions = .isOtherPost
    enum ActionSheetOptions {
        case isMyPost
        case isOtherPost
    }

    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                Text("@username")
                Spacer()
                Button {
                    actionSheetOption = .isMyPost
                    showActionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                }.tint(.black)
            }
            .padding(.horizontal)
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
        }

        .actionSheet(isPresented: $showActionSheet, content: getActionSheet)
    }

    func getActionSheet() -> ActionSheet {
        let shareButton: ActionSheet.Button = .default(Text("Share")) {

        }
        let reportButton: ActionSheet.Button = .destructive(Text("Report")) {

        }
        let deleteButton: ActionSheet.Button = .destructive(Text("Delete")) {

        }
        let cancelBtutton: ActionSheet.Button = .cancel()
        let title = Text("What would you like to do?")
        switch actionSheetOption {
        case .isOtherPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [shareButton, reportButton, cancelBtutton])
        case .isMyPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [shareButton, reportButton, deleteButton, cancelBtutton])
        }
    }
}

//struct ActionsheetBootcamp: View {
//
//    @State private var showConfirmationDialog = false
//    @State private var showModifierDialog = false
//
//    var body: some View {
//        VStack {
//            Button("Show Dialog") { showConfirmationDialog = true }
//            Button("Show ViewMod Dialog") {
//                withAnimation {
//                    showModifierDialog = true
//                }
//            }
//            .padding()
//        }
//        .padding()
//
//        // standard confirmationDialog
//        .confirmationDialog("Test", isPresented: $showConfirmationDialog) {
//            Button { } label: {
//                Label("Add completion", systemImage: "checkmark.circle")
//            }
//            Button { } label: {
//                Label("Add Note", systemImage: "note.text.badge.plus")
//            }
//            Button("Cancel", role: .cancel) {}
//        }
//
//        // custom confirmationDialog with Icons, Cancel added automatically
//        .customConfirmDialog(isPresented: $showModifierDialog) {
//            Button {
//                // action
//                showModifierDialog = false
//            } label: {
//                Label("Add completion", systemImage: "checkmark.circle")
//            }
//            Divider() // unfortunately this is still necessary
//            Button {
//                // action
//                showModifierDialog = false
//            } label: {
//                Label("Add Note", systemImage: "note.text.badge.plus")
//            }
//        }
//    }
//}
//
//
//// *** Custom ConfirmDialog Modifier and View extension
//
//extension View {
//    func customConfirmDialog<A: View, B: View>(isPresented: Binding<Bool>, @ViewBuilder actions: @escaping () -> TupleView<(A, B)>) -> some View {
//        return self.modifier(MyCustomModifier(isPresented: isPresented, actions: {
//            let buttons = actions()
//            VStack(alignment: .leading) {
//                buttons.value.0
//                Divider()
//                buttons.value.1
//            }
//        }))
//    }
//}

struct MyCustomModifier<A>: ViewModifier where A: View {
    
    @Binding var isPresented: Bool
    @ViewBuilder let actions: () -> A
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            ZStack(alignment: .bottom) {
                if isPresented {
                    Color.primary.opacity(0.2)
                        .ignoresSafeArea()
                        .onTapGesture {
                                isPresented = false
                        }
                        .transition(.opacity)
                }
                
                if isPresented {
                    VStack {
                        GroupBox {
                            actions()
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        GroupBox {
                            Button("Cancel", role: .cancel) {
                                    isPresented = false
                            }
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                    .font(.title3)
                    .padding(8)
                    .transition(.move(edge: .bottom))
                }
            }
        }
        .animation(.easeInOut, value: isPresented)
   }
}

struct ActionsheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ActionsheetBootcamp()
    }
}
