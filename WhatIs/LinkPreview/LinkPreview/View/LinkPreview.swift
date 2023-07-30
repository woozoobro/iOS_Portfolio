//
//  LinkPreview.swift
//  LinkPreview
//
//  Created by 우주형 on 2023/07/22.
//

import SwiftUI
import LinkPresentation

struct LinkPreview: UIViewRepresentable {
    var metaData: LPLinkMetadata
    
    func makeUIView(context: Context) -> LPLinkView {
        let preview = LPLinkView(metadata: metaData)
        return preview
    }
    
    func updateUIView(_ uiView: LPLinkView, context: Context) {
        uiView.metadata = metaData
    }
}

