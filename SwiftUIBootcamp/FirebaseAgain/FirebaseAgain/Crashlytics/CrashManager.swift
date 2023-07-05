//
//  CrashManager.swift
//  FirebaseAgain
//
//  Created by 우주형 on 2023/07/04.
//

import Foundation
import FirebaseCrashlytics

final class CrashManager {
    static let shared = CrashManager()
    private init() { }
    
    func setUserId(userId: String) {
        Crashlytics.crashlytics().setUserID(userId)
    }
    
    private func setValue(value: String, key: String) {
        Crashlytics.crashlytics().setCustomValue(value, forKey: key)
    }
    
    func setIsPremiumValue(isPremium: Bool) {
        setValue(value: isPremium.description.lowercased(), key: "user_is_premium")
    }
    
    func addLog(message: String) {
        Crashlytics.crashlytics().log(message)
    }
    
    func sendNotFatal(error: Error) {
        Crashlytics.crashlytics().record(error: error)
    }
}
