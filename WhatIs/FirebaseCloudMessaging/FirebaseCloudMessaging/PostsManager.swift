//
//  PostsManager.swift
//  FirebaseCloudMessaging
//
//  Created by 우주형 on 2023/08/09.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

final class PostsManager {
    
    static let shared = PostsManager()
    private init() { }
    
    private var postCommentsListener: ListenerRegistration? = nil
    
    private let postsCollection = Firestore.firestore().collection("posts")
    
    private func postDocument(id: String) -> DocumentReference {
        postsCollection.document(id)
    }
    private func postCommentCollection(postId: String) -> CollectionReference {
        postDocument(id: postId).collection("comments")
    }
    
    //MARK: - For Posting
    func uploadPost(post: PostModel) async throws {
        try postDocument(id: post.id).setData(from: post, merge: false)
    }
    func updatePost(post: PostModel) async throws {
        let data: [String: Any] = [
            PostModel.CodingKeys.content.rawValue : post.content as Any,
            PostModel.CodingKeys.username.rawValue : post.username as Any,
            PostModel.CodingKeys.userProfileURLString.rawValue : post.userProfileURLString as Any,
        ]
        try await postDocument(id: post.id).updateData(data)
    }
    
    func deletePost(post: PostModel) async throws {
        try await postDocument(id: post.id).delete()
    }
    
    func deleteAllComments(post: PostModel) async throws {
        let querySnapshot = try await postCommentCollection(postId: post.id).getDocuments()
        let batch = Firestore.firestore().batch()
        
        for document in querySnapshot.documents {
            batch.deleteDocument(document.reference)
        }
        try await batch.commit()
    }
    
    func getPost(postId: String) async throws -> PostModel {
        try await postDocument(id: postId).getDocument(as: PostModel.self)
    }
    
    func getAllPostsSortedByDate(descending: Bool, count: Int, lastDocument: DocumentSnapshot?) async throws -> (products: [PostModel], lastDocument: DocumentSnapshot?) {
        let query: Query = postsCollection
        return try await query
            .limit(to: count)
            .order(by: PostModel.CodingKeys.dateCreated.rawValue, descending: descending)
            .startOptionally(afterDocument: lastDocument)
            .getDocumentsWithSnapshot(as: PostModel.self)
    }
    
    //MARK: - For Comment
    func addPostComment(comment: CommentModel) async throws {
        guard let postID = comment.postID else { return }
        let document = postCommentCollection(postId: postID).document(comment.id)
        try document.setData(from: comment, merge: false)
    }
    
    func getAllCommentsSortedByDate(postId: String, descending: Bool) async throws -> [CommentModel] {
        try await postCommentCollection(postId: postId)
            .order(by: CommentModel.CodingKeys.dateCreated.rawValue, descending: descending)
            .getDocuments(as: CommentModel.self)
    }
    
    func updatePostCommentsCount(post: PostModel) async throws {
        let data: [String: Any] = [
            PostModel.CodingKeys.commentsCount.rawValue : (post.commentsCount ?? 0) + 1]
        try await postDocument(id: post.id).updateData(data)
    }
    
    func addListenerForPostComments(postId: String) -> AnyPublisher<[CommentModel], Error> {
        let (publisher, listener) = postCommentCollection(postId: postId)
            .addSnapshotListener(as: CommentModel.self)
        self.postCommentsListener = listener
        return publisher
    }
    
    func removeListenerForPostComments() {
        self.postCommentsListener?.remove()
    }
    
    func deleteComment(postId: String, comment: CommentModel) async throws {
        let data: [String : Any] = [
            CommentModel.CodingKeys.isDeleted.rawValue : true
        ]
        try await postCommentCollection(postId: postId).document(comment.id).updateData(data)
    }
    
    //MARK: - 포스팅 좋아요
    func updatePostLike(post: PostModel, userId: String) async throws {
        let data: [String : Any] = [
            PostModel.CodingKeys.likedByUsers.rawValue : FieldValue.arrayUnion([userId])
        ]
        
        try await postDocument(id: post.id).updateData(data)
    }
    
    func removePostLike(post: PostModel, userId: String) async throws {
        let data: [String: Any] = [
            PostModel.CodingKeys.likedByUsers.rawValue : FieldValue.arrayRemove([userId])
        ]
        try await postDocument(id: post.id).updateData(data)
    }
    
    func getAllPostsCount() async throws -> Int {
        try await postsCollection.aggregateCount()
    }
    
    //MARK: - 유저가 프로필 사진 변경시 기존 포스팅들 url 업데이트
    func updateUserProfileURL(userId: String, profileURL: String) async throws {
        let query = postsCollection.whereField("user_id", isEqualTo: userId)
        let snapshot = try await query.getDocuments()
        let batch = Firestore.firestore().batch()
        for document in snapshot.documents {
            batch.updateData([
                "user_profile_url_string" : profileURL
            ], forDocument: document.reference)
        }
        try await batch.commit()
    }
    
//    func updateUserProfileURLInComment(userId: String, profileURL: String) async throws {
//        let query = Firestore.firestore().collectionGroup("comments").whereField("user_id", isEqualTo: userId)
//        let snapshot = try await query.getDocuments()
//        let batch = Firestore.firestore().batch()
//        for document in snapshot.documents {
//            batch.updateData([
//                "user_profile_url_string" : profileURL
//            ], forDocument: document.reference)
//        }
//        try await batch.commit()
//    }
    
}
