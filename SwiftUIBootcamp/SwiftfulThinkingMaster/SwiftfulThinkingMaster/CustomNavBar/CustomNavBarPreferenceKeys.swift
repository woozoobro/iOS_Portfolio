//
//  CustomNavBarPreferenceKeys.swift
//  SwiftfulThinkingMaster
//
//  Created by 우주형 on 2023/03/31.
//

import Foundation
import SwiftUI

//@State private var showBackButton: Bool = true
//@State private var title: String = "Title" //""
//@State private var subtitle: String? = "Subtitle" //nil

struct CustomNavBarTitlePreferenceKeys: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct CustomNavBarSubtitlePreferenceKeys: PreferenceKey {
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
}

struct CustomNavBarBackButtonHiddenPreferenceKeys: PreferenceKey {
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

extension View {
    
    func customNavigationTitle(_ title: String) -> some View {
        preference(key: CustomNavBarTitlePreferenceKeys.self, value: title)
    }
    
    func customNavigationSubTitle(_ subtitle: String?) -> some View {
        preference(key: CustomNavBarSubtitlePreferenceKeys.self, value: subtitle)
    }
    
    func customNavigationBarBackButtonHidden(_ hidden: Bool) -> some View {
        preference(key: CustomNavBarBackButtonHiddenPreferenceKeys.self, value: hidden)
    }
    
    func customNavBarItems(title: String = "", subtitle: String? = nil, backButtonHidden: Bool = false) -> some View {
        self
            .customNavigationTitle(title)
            .customNavigationSubTitle(subtitle)
            .customNavigationBarBackButtonHidden(backButtonHidden)
    }
    
}
