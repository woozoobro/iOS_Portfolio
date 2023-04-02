//
//  AuthService.swift
//  DogGram
//
//  Created by 우주형 on 2023/04/02.
//

// Used to Authenticate users in Firebase
// Used to handle User accounts in Firebase

import Foundation
import FirebaseAuth

class AuthService {
    
    
    //MARK: - Properties
    
    static let instance = AuthService()
    
    
    //MARK: - Auth User Functions
    
    func logInUserToFirebase(credential: AuthCredential, handler: @escaping (_ providerID: String?, _ isError: Bool) -> ()) {
        
        Auth.auth().signIn(with: credential) { result, error in
            // Check for errors
            if error != nil {
                print("Error logging in to Firebase")
                handler(nil, true)
                return
            }
            // Check for provider ID
            guard let providerID = result?.user.uid else {
                print("Error getting provider ID")
                handler(nil, true)
                return
            }
            // Success Connecting to Firebase
            handler(providerID, false)
        }
        
        
    }
}
