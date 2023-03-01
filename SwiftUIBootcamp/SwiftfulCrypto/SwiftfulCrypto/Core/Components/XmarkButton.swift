//
//  XmarkButton.swift
//  SwiftfulCrypto
//
//  Created by 우주형 on 2023/03/01.
//

import SwiftUI

struct XmarkButton: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
        }
    }
}

struct XmarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XmarkButton()
    }
}
