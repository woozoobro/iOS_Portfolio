//
//  Home.swift
//  LinkPreview
//
//  Created by 우주형 on 2023/07/22.
//

import SwiftUI

struct Home: View {
    @StateObject var messageData: MessageViewModel = MessageViewModel()
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 25) {
                    ForEach(messageData.messages) { message in
                        CardView(message: message)
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                HStack(spacing: 12) {
                    TextField("Enter Message", text: $messageData.message)
                        .textFieldStyle(.roundedBorder)
                        .textCase(.lowercase)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    Button {
                        Task {
                            try await messageData.sendMessage()
                        }
                    } label: {
                        Image(systemName: "paperplane")
                            .font(.title3)
                    }
                }
                .padding()
                .padding(.top)
                .background(.ultraThinMaterial)
            }
            .navigationTitle("Message")
        }
    }
    
//    @ViewBuilder
//    func CardView(message: Message) -> some View {
//        Group {
//            if message.previewLoading {
//                Group {
//                    if let metaData = message.linkMetaData {
//                        LinkPreview(metaData: metaData)
//                            .scaledToFit()
//                            .cornerRadius(15)
//                            .frame(maxWidth: .infinity, alignment: .trailing)
//                    } else {
//                        HStack(spacing: 10) {
//                            Text(message.linkURL?.host() ?? "")
//                                .font(.caption)
//                            ProgressView()
//                                .tint(.white)
//                        }
//                        .padding(.vertical, 10)
//                        .padding(.horizontal)
//                        .background {
//                            Color.gray.opacity(0.35).cornerRadius(10)
//                        }
//                        .frame(maxWidth: .infinity, alignment: .trailing)
//                    }
//                }
//            } else {
//                Text(.init(message.messageString))
//                    .padding(.vertical, 10)
//                    .padding(.horizontal)
//                    .foregroundColor(Color.white)
//                    .background(Color.green)
//                    .cornerRadius(10)
//                    .frame(maxWidth: .infinity, alignment: .trailing)
//            }
//        }
//    }
}

struct CardView: View {
    let message: Message
    var body: some View {
        VStack {
            Text(.init(message.messageString))
                .padding(.vertical, 10)
                .padding(.horizontal)
                .foregroundColor(Color.white)
                .background(Color.green)
                .cornerRadius(10)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            if !message.messageString.detectURLs().isEmpty {
                Group {
                    if let metaData = message.linkMetaData {
                        LinkPreview(metaData: metaData)
                            .scaledToFit()
                            .cornerRadius(15)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    } else {
                        HStack(spacing: 10) {
                            Text(message.linkURL?.host() ?? "")
                                .font(.caption)
                            ProgressView()
                                .tint(.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background {
                            Color.gray.opacity(0.35).cornerRadius(10)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
