//
//  FirebaseCloudMessagingApp.swift
//  FirebaseCloudMessaging
//
//  Created by 우주형 on 2023/08/08.
//

import SwiftUI
import UserNotifications

import FirebaseCore
import FirebaseMessaging
import FirebaseAuth
import FirebaseFirestore

@main
struct FirebaseCloudMessagingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var userStore: UserStore = UserStore()
    @StateObject private var forumVM: ForumViewModel = ForumViewModel()
    @StateObject private var navPathFinder = NavigationPathFinder()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userStore)
                .environmentObject(forumVM)
                .environmentObject(navPathFinder)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    let gcmMessageIDKey = "gcm.message_id"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        
        UNUserNotificationCenter.current().delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]

        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
        )
                
        application.registerForRemoteNotifications()
        
        return true
    }
            
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        // 스위즐링 꺼놨으면 Analytics가 Messaging.messaging().appDidReceiveMessage(userInfo)를 해야함
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
    }
    
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any]) async
    -> UIBackgroundFetchResult {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
        
        return UIBackgroundFetchResult.newData
    }
    
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Unable to register for remote notifications: \(error.localizedDescription)")
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // 스위즐링 꺼져 있으면 APNs 토큰 여기서 설정해줘야함!
        Messaging.messaging().apnsToken = deviceToken
    }
    
}

extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Firebase registration token: \(String(describing: fcmToken))")
        
        let dataDict: [String: String] = ["token": fcmToken ?? ""]
        NotificationCenter.default.post(
            name: Notification.Name("FCMToken"),
            object: nil,
            userInfo: dataDict
        )
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
        if let userId = Auth.auth().currentUser?.uid {
            let userRef = Firestore.firestore().collection("users").document(userId)
            userRef.updateData(dataDict)
        }
    }
}


extension AppDelegate: UNUserNotificationCenterDelegate {
        
//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        let userInfo = notification.request.content.userInfo
//        print("willPresent: userInfo: ", userInfo)
//        completionHandler([.banner, .sound, .badge])
//    }
    
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        let userInfo = response.notification.request.content.userInfo
//        print("didReceive: userInfo: ", userInfo)
//        completionHandler()
//    }
    
    // 앱이 실행중일 때 푸시가 올 경우
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        let userInfo = notification.request.content.userInfo
        print("willPresent: userInfo: ", userInfo)
        return [.banner, .sound, .badge]
    }
    
    // 푸시메시지를 받았을 때
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        let userInfo = response.notification.request.content.userInfo
        print("didReceive: userInfo: ", userInfo)
    }
    
}
