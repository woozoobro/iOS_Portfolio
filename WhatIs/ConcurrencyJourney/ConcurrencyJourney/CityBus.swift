//
//  CityBus.swift
//  ConcurrencyJourney
//
//  Created by 우주형 on 2023/08/05.
//

import SwiftUI

class CityBusManager {
    let ticket = URL(string: "https://img.icons8.com/?size=512&id=WBn88SGX4mke&format=png")!
    
    func downloadWithEscaping(completion: @escaping (UIImage?, Error?) -> Void) {
        URLSession.shared.dataTask(with: ticket) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            } else if (response as? HTTPURLResponse)?.statusCode != 200 {
                completion(nil, URLError(.badServerResponse))
                return
            } else {
                guard let data = data else { return }
                
                let image = UIImage(data: data)
                completion(image, nil)
            }
        }
        .resume()
    }
    
    func downloadWithAsync() async throws -> UIImage? {
        
        let (data, response) = try await URLSession.shared.data(from: ticket)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return UIImage(data: data)
    }
    
}

@MainActor
class CityBusViewModel: ObservableObject {
    @Published var passenger: UIImage?
    
    private let busManager = CityBusManager()
    
    func fetchPassengerImage() async {
//        busManager.downloadWithEscaping { [weak self] passenger, error in
//            DispatchQueue.main.async {
//                self?.passenger = passenger
//            }
//        }
        
        let newPassenger = try? await busManager.downloadWithAsync()
        self.passenger = newPassenger
        
    }
}

struct CityBus: View {
    @StateObject private var viewModel = CityBusViewModel()
    
    var body: some View {
        VStack {
            if let passengerImage = viewModel.passenger {
                Image(uiImage: passengerImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .cornerRadius(10)
            }
            
            Button("승객 태우기") {
                Task {
                    await viewModel.fetchPassengerImage()
                }
            }
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
        }
    }
}

struct CityBus_Previews: PreviewProvider {
    static var previews: some View {
        CityBus()
    }
}
