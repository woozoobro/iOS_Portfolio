//
//  UIApplication.swift
//  SwiftfulCrypto2
//
//  Created by 우주형 on 2023/03/05.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

