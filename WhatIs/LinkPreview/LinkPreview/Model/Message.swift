//
//  Message.swift
//  LinkPreview
//
//  Created by 우주형 on 2023/07/22.
//

import SwiftUI
import LinkPresentation

struct Message: Identifiable {
    var id = UUID().uuidString
    var messageString: String
    var date: Date = Date()
//    var previewLoading: Bool = false
    var linkMetaData: LPLinkMetadata?
    var linkURL: URL?
}
