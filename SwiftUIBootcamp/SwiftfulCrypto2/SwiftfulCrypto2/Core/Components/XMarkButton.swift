//
//  XMarkButton.swift
//  SwiftfulCrypto2
//
//  Created by 우주형 on 2023/03/07.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
        }
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}
