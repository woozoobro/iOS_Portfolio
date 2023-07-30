//
//  ConcurrencyBible.swift
//  WooZooSwiftUI
//
//  Created by 우주형 on 2023/07/26.
//

import SwiftUI

class ConcurrencyBibleManager {
    let isActive: Bool = false
    
    func getTitle() throws -> String {
        if isActive {
            return "New Text"
        } else {
            throw URLError(.badURL)
        }
    }
}

class DownloadImageLoader {
    
    func downloadWithEscaping(completion: @escaping (_ image: UIImage?, _ error: Error?) -> Void ) {
        let url = URL(string: "https://picsum.photos/200")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                let image = UIImage(data: data),
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300
            else {
                completion(nil, error)
                return
            }
            
            completion(image, nil)
        }
        .resume()
    }
    
    func downloadWithAsync() async throws -> UIImage? {
        let url = URL(string: "https://picsum.photos/200")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return UIImage(data: data)
        } catch {
            throw error
        }
    }
}

@MainActor
class ConcurrencyBibleViewModel: ObservableObject {
    let manger = ConcurrencyBibleManager()
    let loader = DownloadImageLoader()
    
    @Published var text: String = "Starting text."
    @Published var image: UIImage? = nil
    
    func fetchImage() {
        loader.downloadWithEscaping { [weak self] image, error in
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
    
    func fetchImage2() async {
        self.image = try? await loader.downloadWithAsync()
    }
    
    func fetchTitle() {
        do {
            let optionalString = try? manger.getTitle()
            let newTitle = try manger.getTitle()
            self.text = newTitle
        } catch let error {
            self.text = error.localizedDescription
        }
    }
}

struct ConcurrencyBible: View {
    @StateObject private var viewModel = ConcurrencyBibleViewModel()
    
    var body: some View {
        VStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            
            Text(viewModel.text)
                .padding()
                .background(.green)
                .onTapGesture {
                    viewModel.fetchTitle()
                }
        }
        .onAppear {
            Task {
                await viewModel.fetchImage2()
            }
        }
    }
}

struct ConcurrencyBible_Previews: PreviewProvider {
    static var previews: some View {
        ConcurrencyBible()
    }
}
