//
//  DropdownMenuList.swift
//  DropDownMenu
//
//  Created by 우주형 on 2023/03/10.
//

import SwiftUI

struct DropdownMenuList: View {
    let options: [DropdownMenuOption]
    
    let onSelectedAction: (_ option: DropdownMenuOption) -> Void
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 2) {
                ForEach(options) { option in
                    DropdownMenuListRow(option: option, onSelectedAction: onSelectedAction)
                }
            }
        }
        .frame(height: 200)
        .padding(.vertical, 5)
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(.gray, lineWidth: 2)
        }
    }
}

struct DropdownMenuList_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenuList(options: DropdownMenuOption.testAllMonths, onSelectedAction: { _ in })
    }
}
