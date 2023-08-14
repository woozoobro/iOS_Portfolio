//
//  ToolbarButtonComponent.swift
//  FirebaseCloudMessaging
//
//  Created by 우주형 on 2023/08/10.
//

import SwiftUI

struct ToolbarButtonComponent: View {
    let systemName: String
    let foreColor: Color
    let backColor: Color
    let fontSize: Font
    
    let action: () -> Void
    
    init(systemName: String, foreColor: Color = .white, backColor: Color = .orange, fontSize: Font = .largeTitle, action: @escaping () -> Void) {
        self.systemName = systemName
        self.foreColor = foreColor
        self.backColor = backColor
        self.fontSize = fontSize
        
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .font(fontSize)
                .bold()
                .foregroundColor(foreColor)
                .background {
                    Circle()
                        .fill(backColor)
                        .frame(width: 50, height: 50)                        
                }
        }
    }
}
