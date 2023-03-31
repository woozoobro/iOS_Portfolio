//
//  CustomNavBarContainerView.swift
//  SwiftfulThinkingMaster
//
//  Created by 우주형 on 2023/03/31.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    let content: Content
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    @State private var subtitle: String? = nil
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(showBackButton: showBackButton, title: title, subtitle: subtitle)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKeys.self) { value in
            self.title = value
        }
        .onPreferenceChange(CustomNavBarSubtitlePreferenceKeys.self) { value in
            self.subtitle = value
        }
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKeys.self) { value in
            self.showBackButton = !value
        }
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarContainerView {
            ZStack {
                Color.green.ignoresSafeArea()
                Text("Hello, world!")
                    .foregroundColor(.white)
                    .customNavigationTitle("New Title")
                    .customNavigationSubTitle("SubTitle")
                    .customNavigationBarBackButtonHidden(false)
            }
        }
    }
}
