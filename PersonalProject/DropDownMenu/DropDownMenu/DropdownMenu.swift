//
//  DropdownMenu.swift
//  DropDownMenu
//
//  Created by 우주형 on 2023/03/10.
//

import SwiftUI

struct DropdownMenu: View {
    @State private var isOptionPresented: Bool = false
    @Binding var selectedOption: DropdownMenuOption?
    let placeholder: String
    let options: [DropdownMenuOption]
    
    var body: some View {
        Button {
            withAnimation {
                isOptionPresented.toggle()
            }
        } label: {
            HStack {
                Text(selectedOption == nil ? placeholder : selectedOption?.option ?? "")
                    .fontWeight(.medium)
                    .foregroundColor(selectedOption == nil ? .gray : .black)
                Spacer()
                Image(systemName: "chevron.down")
                    .rotationEffect(Angle(degrees: isOptionPresented ? 180 : 0))
                    .fontWeight(.medium)
                    .foregroundColor(.black)
            }
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(.gray, lineWidth: 2)
        }
        .overlay(alignment: .top) {
            VStack {
                if isOptionPresented {
                    Spacer(minLength: 60)
                    DropdownMenuList(options: options) { option in
                        isOptionPresented = false
                        selectedOption = option
                    }
                }
            }
        }
        .padding(.horizontal)

    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu(
            selectedOption: .constant(nil),
            placeholder: "Select your birth month",
            options: DropdownMenuOption.testAllMonths)
    }
}
