//
//  ContentView.swift
//  InternetProject
//
//  Created by 우주형 on 2023/04/19.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var showWebView = false
    private let urlString: String = "https://mandarin.oopy.io"
    
    var body: some View {
        VStack(spacing: 40) {
            WebView(url: URL(string: urlString)!).frame(height: 500)
                .shadow(color: .black.opacity(0.3), radius: 20, x: 5, y: 5)
            
            Link(destination: URL(string: urlString)!) {
                Text("Open in a new window")
                    .foregroundColor(.blue)
            }
            
            Button("Open in a sheet") {
                showWebView.toggle()
            }
            .sheet(isPresented: $showWebView) {
                WebView(url: URL(string: urlString)!)
            }
            
            Spacer()
        }
    }
}

struct WebView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
