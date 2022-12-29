import UIKit

enum NetworkError: Error {
    case invalidRequest
    case transportError(Error)
    case responseError(statusCode: Int)
    case noData
    case decodingError(Error)
}

struct GithubProfile: Codable {
    let login: String
    let avatarURL: String
    let htmlURL: String
    let followers: Int
    let following: Int
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
        case htmlURL = "html_url"
        case followers
        case following
    }
}

final class NetworkService {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    
    func fetchProfile(userName: String, completion: @escaping (Result<GithubProfile, Error>) -> Void) {
        let url = URL(string: "https://api.github.com/users/\(userName)")!
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(NetworkError.transportError(error)))
                return
            }
            if let httpResponse = response as? HTTPURLResponse, !(200..<300).contains(httpResponse.statusCode) {
                completion(.failure(NetworkError.responseError(statusCode: httpResponse.statusCode)))
                return
            }
            guard let safeData = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            // data -> GithubProfile
            do {
                let decoder = JSONDecoder()
                let profile = try decoder.decode(GithubProfile.self, from: safeData)
                completion(.success(profile))
            } catch let error as NSError {
                completion(.failure(NetworkError.decodingError(error)))
            }
        }
        task.resume()
    }
}

// network 담당 NetworkService
// NetworkService 이용한 네트워크 작업

let networkService = NetworkService(configuration: .default)

networkService.fetchProfile(userName: "woozoobro") { result in
    switch result {
    case .success(let profile):
        print("Profile: \(profile)")
    case .failure(let error):
        print("Error: \(error)")
    }
}

