//
//  MessageModel.swift
//  LinkPreview
//
//  Created by 우주형 on 2023/07/22.
//

import SwiftUI
import LinkPresentation

@MainActor
final class MessageViewModel: ObservableObject {
    @Published var message: String = ""
    @Published var messages: [Message] = []
    
    func sendMessage() async throws {
        guard
            let url = message.detectURLs().first,
            UIApplication.shared.canOpenURL(url)
        else {
            addToMessage()
            return
        }
        let urlMessage = Message(messageString: message, linkURL: url)
        messages.append(urlMessage)
        
        let provider = LPMetadataProvider()
        
        do {
            self.message = ""
            let meta = try await provider.startFetchingMetadata(for: url)
            if let index = messages.firstIndex(where: {$0.id == urlMessage.id}) {
                messages[index].linkMetaData = meta
            }
        } catch {
            print(error.localizedDescription)
            addToMessage()
        }
    }
    
    private func addToMessage() {
        messages.append(Message(messageString: message))
        message = ""
    }
}


extension String {
    func detectURLs() -> [URL] {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))
            return matches.compactMap { $0.url }
        } catch {
            return []
        }
    }
}
