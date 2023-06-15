//
//  Utilities.swift
//  FirebaseAgain
//
//  Created by 우주형 on 2023/06/15.
//

import Foundation
import UIKit

//final class Utilities {
//    static let shared = Utilities()
//    private init() { }
//
//    @MainActor
//    func topViewController(controller: UIViewController? = nil) -> UIViewController? {
//        let controller = controller ?? UIApplication.shared.keyWindow?.rootViewController
//
//        if let navigationController = controller as? UINavigationController {
//            return topViewController(controller: navigationController.visibleViewController)
//        }
//        if let tabController = controller as? UITabBarController {
//            if let selected = tabController.selectedViewController {
//                return topViewController(controller: selected)
//            }
//        }
//        if let presented = controller?.presentedViewController {
//            return topViewController(controller: presented)
//        }
//        return controller
//    }
//}
