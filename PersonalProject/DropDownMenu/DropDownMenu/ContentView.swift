//
//  ContentView.swift
//  DropDownMenu
//
//  Created by 우주형 on 2023/03/10.
//

import SwiftUI

struct ContentView: View {
    @State private var birthMonth: DropdownMenuOption? = nil
    
    var body: some View {
        VStack {
            DropdownMenu(
                selectedOption: $birthMonth,
                placeholder: "Select your birth month.",
                options: DropdownMenuOption.testAllMonths)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
