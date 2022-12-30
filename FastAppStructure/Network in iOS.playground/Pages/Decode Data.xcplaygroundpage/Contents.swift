//: [Previous](@previous)

import Foundation

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

// App Model <-> JSON
// 모델을 JSON으로 바꾸는게 인코딩, 그 반대는 디코딩

let configuration = URLSessionConfiguration.default
let session = URLSession(configuration: configuration)
let url = URL(string: "https://api.github.com/users/woozoobro")!

let task = session.dataTask(with: url) { data, response, error in
    guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
        print("--->response: \(response!)")
        return
    }
    
    guard let safeData = data else { return }
    // data -> GithubProfile
    do {
        let decoder = JSONDecoder()                   //메타 타입 개념 상기!
        let profile = try decoder.decode(GithubProfile.self, from: safeData)
        print("profile: \(profile)")
    } catch let error as NSError {
        print("error: \(error)")
    }
}

task.resume()

//: [Next](@next)
