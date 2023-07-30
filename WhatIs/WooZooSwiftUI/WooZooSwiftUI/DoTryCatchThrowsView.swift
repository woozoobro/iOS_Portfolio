//
//  DoTryCatchThrowsView.swift
//  WooZooSwiftUI
//
//  Created by 우주형 on 2023/07/26.
//

import SwiftUI

class DoTryCatchThrowsDataManager {
    let isActive: Bool = false
    
    func getTitle() throws -> String {
        if isActive {
            return "NEW TEXT!"
        } else {
            throw URLError(.badServerResponse)
        }
    }
}

class ImageLoader {
    let url = URL(string: "https://picsum.photos/200")!
    
    func downloadWithEscaping(completion: @escaping (_ image: UIImage?, _ error: Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("데이터가 없네요")
                return
            }
            
            guard error == nil else {
                print("에러: \(error)가 발생했어요")
                return
            }
            
            if (response as? HTTPURLResponse)?.statusCode != 200 {
                print("응답 실패")
                return
            }
            
            guard let image = UIImage(data: data) else { return }
            
            completion(image, nil)
        }
        .resume()
    }
    
}


class DoTryCatchThrowsViewModel: ObservableObject {
    let manager = DoTryCatchThrowsDataManager()
    
    @Published var text: String = "Starting text."
    @Published var image: UIImage? = nil
    
    func fetchImage() {
        self.image = UIImage(systemName: "heart.fill")
    }
    
    func fetchTitle() {
        let newTitle = try? manager.getTitle()
    }
}

struct DoTryCatchThrowsView: View {
    @StateObject private var viewModel = DoTryCatchThrowsViewModel()
    var body: some View {
        Text(viewModel.text)
            .frame(width: 300, height: 300)
            .background(Color.blue)
            .onTapGesture {
                viewModel.fetchTitle()
            }
    }
}

struct DoTryCatchThrowsView_Previews: PreviewProvider {
    static var previews: some View {
        DoTryCatchThrowsView()
    }
}
