//
//  ContentView.swift
//  ChatAI2
//
//  Created by 우주형 on 2023/03/27.
//

import OpenAISwift
import SwiftUI


final class ViewModel: ObservableObject {
    init() { }
    
    private var client: OpenAISwift?
    
    func setup() {
        client = OpenAISwift(authToken: "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")
    }
    
    func send(text: String, completion: @escaping (String) -> Void ) {
        client?.sendCompletion(
            with: text,
            maxTokens: 500,
            completionHandler: { result in
                switch result {
                case .success(let model):
                    let output = model.choices.first?.text ?? ""
                    completion(output)
                case .failure:
                    break
                }
            })
    }
}

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var text = ""
    @State var userAnswer = [String]()
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                ForEach(userAnswer, id: \.self) { string in
                    HStack {
                        Text(string)
                        Spacer()
                    }
                }
            }
            Spacer()
            
            HStack {
                TextField("질문을 입력해주세요...", text: $text)
                Button {
                    send()
                } label: {
                    Text("전송")
                        .foregroundColor(Color.orange)
                }
            }
            .padding()
            .background(Color.orange.opacity(0.2).cornerRadius(18))
        }
        .onAppear {
            viewModel.setup()
        }
        .padding()
    }
    
}


extension ContentView {
    func send() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        userAnswer.append("Me: \(text)")
        viewModel.send(text: text) { response in
            DispatchQueue.main.async {
                self.userAnswer.append("ChatGPT: " + response)
                self.text = ""
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
