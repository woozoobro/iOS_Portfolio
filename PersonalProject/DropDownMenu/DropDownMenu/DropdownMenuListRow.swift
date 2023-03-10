//
//  DropdownMenuListRow.swift
//  DropDownMenu
//
//  Created by 우주형 on 2023/03/10.
//

import SwiftUI

struct DropdownMenuListRow: View {
    let option: DropdownMenuOption
    let onSelectedAction: (_ option: DropdownMenuOption) -> Void
    
    var body: some View {
        Button {
            onSelectedAction(option)
        } label: {
            Text(option.option)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(.black)
        .padding(.vertical, 5)
        .padding(.horizontal)

    }
}

struct DropdownMenuListRow_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenuListRow(option: DropdownMenuOption.testSingleMonth, onSelectedAction: { _ in })
    }
}
