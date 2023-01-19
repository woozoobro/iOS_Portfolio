//
//  ActionsheetBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/16.
//

import SwiftUI

struct ActionsheetBootcamp: View {
    
    @State var showActionSheet: Bool = false
    var body: some View {
        Button("Click me") {
            showActionSheet.toggle()
        }
        .confirmationDialog("Are you sure?", isPresented: $showActionSheet) {
            Button("Delete all Items?", role: .destructive) {
            }
        } message: {
            Text("You cannot undo this action")
        }
    }        
}

struct ActionsheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ActionsheetBootcamp()
    }
}
