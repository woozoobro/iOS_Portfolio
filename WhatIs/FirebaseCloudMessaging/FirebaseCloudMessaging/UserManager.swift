//
//  UserManager.swift
//  FirebaseCloudMessaging
//
//  Created by 우주형 on 2023/08/09.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserNeeds: Codable {
    let userId: String
    let job: String
    let myExperience: Int
    let teammateExperience: String
    let myStyle: String
    let workTime: [String: [String]]
}

struct DBUser: Codable {
    let userId: String
    let username: String?
    let email: String?
    let photoUrl: String?
    let dateCreated: Date?
    let likedPosts: [String]?
    let isDeleted: Bool?
    let profileImagePath: String?
    let profileImagePathUrl: String?
    let userNeeds: UserNeeds?
    let providerID: String?
//    let FCMToken: String?
    
    init(auth: AuthDataResultModel) {
        self.userId = auth.uid
        self.username = auth.username
        self.email = auth.email
        self.photoUrl = auth.photoUrl
        self.dateCreated = Date()
        self.likedPosts = nil
        self.isDeleted = nil
        self.profileImagePath = nil
        self.profileImagePathUrl = nil
        self.userNeeds = nil
        self.providerID = auth.providerID
    }
    
    init(
        userId: String,
        username: String? = nil,
        email: String? = nil,
        photoUrl: String? = nil,
        dateCreated: Date? = nil,
        likedPosts: [String]? = nil,
        isDeletd: Bool? = nil,
        profileImagePath: String? = nil,
        profileImagePathUrl: String? = nil,
        userNeeds: UserNeeds? = nil,
        providerID: String? = nil
    ) {
        self.userId = userId
        self.username = username
        self.email = email
        self.photoUrl = photoUrl
        self.dateCreated = dateCreated
        self.likedPosts = likedPosts
        self.isDeleted = isDeletd
        self.profileImagePath = profileImagePath
        self.profileImagePathUrl = profileImagePathUrl
        self.userNeeds = userNeeds
        self.providerID = providerID
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case username = "user_name"
        case email = "email"
        case photoUrl = "photo_url"
        case dateCreated = "date_created"
        case likedPosts = "liked_posts"
        case isDeleted = "is_deleted"
        case profileImagePath = "profile_image_path"
        case profileImagePathUrl = "profile_image_path_url"
        case userNeeds = "user_needs"
        case providerID = "provider_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.username = try container.decodeIfPresent(String.self, forKey: .username)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.photoUrl = try container.decodeIfPresent(String.self, forKey: .photoUrl)
        self.dateCreated = try container.decodeIfPresent(Date.self, forKey: .dateCreated)
        self.likedPosts = try container.decodeIfPresent([String].self, forKey: .likedPosts)
        self.isDeleted = try container.decodeIfPresent(Bool.self, forKey: .isDeleted)
        self.profileImagePath = try container.decodeIfPresent(String.self, forKey: .profileImagePath)
        self.profileImagePathUrl = try container.decodeIfPresent(String.self, forKey: .profileImagePathUrl)
        self.userNeeds = try container.decodeIfPresent(UserNeeds.self, forKey: .userNeeds)
        self.providerID = try container.decodeIfPresent(String.self, forKey: .providerID)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.username, forKey: .username)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.photoUrl, forKey: .photoUrl)
        try container.encodeIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(self.likedPosts, forKey: .likedPosts)
        try container.encodeIfPresent(self.isDeleted, forKey: .isDeleted)
        try container.encodeIfPresent(self.profileImagePath, forKey: .profileImagePath)
        try container.encodeIfPresent(self.profileImagePathUrl, forKey: .profileImagePathUrl)
        try container.encodeIfPresent(self.userNeeds, forKey: .userNeeds)
        try container.encodeIfPresent(self.providerID, forKey: .providerID)
    }
    
}

final class UserManager {
    
    static let shared = UserManager()
    private init() { }
    
    private let userCollection = Firestore.firestore().collection("users")
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
//        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()

    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func createNewUser(user: DBUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false)
    }
    
    func getUser(userId: String) async throws -> DBUser {
        try await userDocument(userId: userId).getDocument(as: DBUser.self)
    }
    
    func userExists(userId: String) async throws -> Bool {
        let document = try await userDocument(userId: userId).getDocument()
        return document.exists
    }

    //MARK: - Liking Post
    func updateUserLikedPosts(userId: String, postId: String) async throws {
        let data: [String : Any] = [
            DBUser.CodingKeys.likedPosts.rawValue : FieldValue.arrayUnion([postId])
        ]
        try await userDocument(userId: userId).updateData(data)
    }
    
    func removeUserLikedPost(userId: String, postId: String) async throws {
        let data: [String: Any] = [
            DBUser.CodingKeys.likedPosts.rawValue : FieldValue.arrayRemove([postId])
        ]
        try await userDocument(userId: userId).updateData(data)
    }
    
    func userHasLikedPost(userId: String, postId: String) async throws -> Bool {
        let user = try await getUser(userId: userId)
        return user.likedPosts?.contains(postId) ?? false
    }
    
    func getUserWhoLikedPost(postId: String) async throws -> [DBUser] {
        let snapshot = try await userCollection
            .whereField("liked_posts", arrayContains: postId)
            .getDocuments()
        
        return try snapshot.documents.map({ document in
            try document.data(as: DBUser.self)
        })
    }
    
    //MARK: - UserNeeds 메소드
    func addUserNeeds(userId: String, userNeeds: UserNeeds) async throws {
        guard let data = try? encoder.encode(userNeeds) else {
            throw URLError(.badURL)
        }
        
        let dict: [String: Any] = [
            DBUser.CodingKeys.userNeeds.rawValue : data
        ]
        
        try await userDocument(userId: userId).updateData(dict)
    }
    
    func getUserNeeds(userId: String) async throws -> [WorkTime] {
        if let userNeeds = try await getUser(userId: userId).userNeeds {
            var result = [WorkTime]()
            userNeeds.workTime.forEach { (weekday, timeList) in
                let eachTime = timeList.map { time in
                    let converted = convertTimeToInt(time: time)
                    return WorkTime(weekday: weekday, startTime: converted.0, endTime: converted.1)
                }
                result.append(contentsOf: eachTime)
            }
            
            return result.sorted { weekdayToInt($0.weekday) < weekdayToInt($1.weekday) }
            
        } else { return WorkTime.timeList }
    }
    
    private func weekdayToInt(_ weekday: String) -> Int {
        switch weekday {
        case "일": return 1
        case "월": return 2
        case "화": return 3
        case "수": return 4
        case "목": return 5
        case "금": return 6
        case "토": return 7
        default: return 0
        }
    }
    
    private func convertTimeToInt(time: String) -> (Int, Int) {
        switch time {
            case "아침": return (7,12)
            case "낮": return (12,17)
            case "저녁": return (17,22)
            case "밤": return (22,24)
            default: return (7,7)
        }
    }
    
    //MARK: - Settings Function
    
    func updateUsername(userId: String, username: String) async throws {
        let data: [String: Any] = [
            DBUser.CodingKeys.username.rawValue : username
        ]
        
        try await userDocument(userId: userId).updateData(data)
    }
    
    func updateDeleted(userId: String, isDeleted: Bool) async throws {
        let data: [String: Any] = [
            DBUser.CodingKeys.isDeleted.rawValue : isDeleted
        ]
        try await userDocument(userId: userId).updateData(data)
    }
    
    func updateUserProfileImagePath(userId: String, path: String?, url: String?) async throws {
        let data: [String: Any] = [
            DBUser.CodingKeys.profileImagePath.rawValue : path as Any,
            DBUser.CodingKeys.profileImagePathUrl.rawValue : url as Any,
        ]
        try await userDocument(userId: userId).updateData(data)
    }
    
    //MARK: - Get User Image for Post
    
    func getImageURLPath(userId: String) async throws -> String? {
        let snapshot = try await userDocument(userId: userId).getDocument()
        return snapshot.get(DBUser.CodingKeys.profileImagePathUrl.rawValue) as? String
    }
    
    //MARK: - Update applied Projects
    
//    func updateAppliedProjects(userId: String, project: ProjectModel) async throws {
//        try userDocument(userId: userId).collection("applied_projects").document(project.projectId).setData(from: project, merge: false)
//    }
//
//    func getAllAppliedProjects(userId: String) async throws -> [ProjectModel] {
//        try await userDocument(userId: userId).collection("applied_projects").getDocuments(as: ProjectModel.self)
//    }
    
}
