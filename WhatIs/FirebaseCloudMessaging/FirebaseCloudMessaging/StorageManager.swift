//
//  StorageManager.swift
//  Mandarin2
//
//  Created by 우주형 on 2023/04/27.
//

import Foundation
import FirebaseStorage
import UIKit

final class StorageManager {
    
    static let shared = StorageManager()
    private init() { }
    
    private let storage = Storage.storage().reference()
    
    private var imagesReference: StorageReference { // 없어도 될듯?
        storage.child("images")
    }
    
    private func userReference(userId: String) -> StorageReference {
        storage.child("users").child(userId)
    }
    
    func getPathForImage(path: String) -> StorageReference {
        Storage.storage().reference(withPath: path)
    }
    
    func getUrlForImage(path: String) async throws -> URL {
        try await getPathForImage(path: path).downloadURL()
    }
    
    func getData(userId: String, path: String) async throws -> Data {
        try await storage.child(path).data(maxSize: 4 * 1024 * 1024)
    }
    
    func getImage(userId: String, path: String) async throws -> UIImage {
        let data = try await getData(userId: userId, path: path)
        
        guard let image = UIImage(data: data) else {
            throw URLError(.badServerResponse)
        }
        return image
    }
    
    func saveImage(data: Data, userId: String) async throws -> (path: String, name: String) {
        let meta = StorageMetadata()
        meta.contentType = "image/jpeg"
        
        let path = "\(UUID().uuidString).jpeg"
        
        let maxSize: Int64 = 1 * 1024 * 1024 // 1MB를 바이트 단위로 변환

        // 이미지 데이터의 크기가 최대 크기보다 큰 경우 압축하여 크기를 제한
        var compressedData = data
        if data.count > maxSize {
            let compression: CGFloat = CGFloat(maxSize) / CGFloat(data.count)
            compressedData = UIImage(data: data)!.jpegData(compressionQuality: compression)!
        }
        
        let returnedMetaData = try await userReference(userId: userId).child(path).putDataAsync(compressedData, metadata: meta)
        
        guard let returnedPath = returnedMetaData.path, let returnedName = returnedMetaData.name else {
            throw URLError(.badServerResponse)
        }
        
        return (returnedPath, returnedName)
    }
    
//    func saveImage(image: UIImage, userId: String) async throws -> (path: String, name: String) {
//        let targetSizeMB: Int = 1
//        let targetSize: Int = targetSizeMB * 1024 * 1024
//
//        let maxCompression: CGFloat = 1.0
//        var compression: CGFloat = 0.9
//
//        guard var data = image.jpegData(compressionQuality: 1) else {
//            throw URLError(.backgroundSessionWasDisconnected)
//        }
//        while data.count > targetSize {
//            compression -= 0.1
//
//            guard compression >= 0 else { throw URLError(.unknown)}
//            data = image.jpegData(compressionQuality: compression)!
//
//            if compression <= maxCompression {
//                break
//            }
//        }
//
//        return try await saveImage(data: data, userId: userId)
//    }
    
    func deleteImage(path: String) async throws {
        try await getPathForImage(path: path).delete()
    }
}
