//
//  ImageManager.swift
//  DogGram
//
//  Created by 우주형 on 2023/04/05.
//

import Foundation
import FirebaseStorage //holds images and videos
import UIKit

class ImageManager {
    //MARK: - Properties
    static let instance = ImageManager()
    
    private var REF_STOR = Storage.storage()
    
    //MARK: - Public Functions
    // Functions we call from other places in the app
    
    func uploadProfileImage(userID: String, image: UIImage) {
        
        // Get the path where we will save the image
        let path = getProfileImagePath(userID: userID)
        
        // Save image to path
        uploadImage(path: path, image: image) { _ in }
        
    }
    
    func uploadPostImage(postID: String, image: UIImage, handler: @escaping (_ success: Bool) -> ()) {
        // Get the Path wherewe will save the image
        let path = getPostImagePath(postID: postID)
        // Save image to path
        uploadImage(path: path, image: image) { success in
            handler(success)
        }
    }
    
    //MARK: - Private Functions
    // Functions we call from this file only
    
    private func getProfileImagePath(userID: String) -> StorageReference {
        let userPath = "users/\(userID)/profile"
        let storatePath = REF_STOR.reference(withPath: userPath)
        return storatePath
    }
    
    private func getPostImagePath(postID: String) -> StorageReference {
        let postPath = "posts/\(postID)/1"
        let storagePath = REF_STOR.reference(withPath: postPath)
        return storagePath
    }
    
    private func uploadImage(path: StorageReference, image: UIImage, handler: @escaping (_ success: Bool) -> ()) {
        
        var compression: CGFloat = 1.0  // Loops down by 0.05
        let maxFileSize: Int = 240 * 240 // Maximum file size that we want to save
        let maxCompression: CGFloat = 0.05  // Maximum compression we ever allow
        
        // Get image data
        guard var originalData = image.jpegData(compressionQuality: compression) else {
            print("Error getting data from image")
            handler(false)
            return
        }
        
        // Check maximum file size
        while (originalData.count > maxFileSize) && (compression > maxCompression) {
            compression -= 0.05
            if let comperssedData = image.jpegData(compressionQuality: compression) {
                originalData = comperssedData
            }
            print(compression)
        }
        
        // Get image data
        guard let finalData = image.jpegData(compressionQuality: compression) else {
            print("Error getting data from image")
            handler(false)
            return
        }
        
        // Get photo metadata
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        // Save data to path
        path.putData(finalData, metadata: metadata) { (_, error) in
            if let error = error {
                // Error
                print("Error uploading image. \(error)")
                handler(false)
                return
            } else {
                // Success
                print("Success uploading image")
                handler(true)
                return
            }
        }
        
    }
    
}
