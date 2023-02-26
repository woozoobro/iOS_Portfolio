//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by 우주형 on 2023/02/26.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
