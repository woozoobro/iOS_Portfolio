//
//  NavigationBarWithButton.swift
//  MyAssets
//
//  Created by 우주형 on 2023/01/12.
//

import SwiftUI

struct NavigationBarWithButton: ViewModifier {
    var title: String = ""
    func body(content: Content) -> some View {
        return content
            .navigationBarItems(
                leading: Text(title)
                .font(.system(size: 24, weight: .bold))
                .padding(),
                trailing: Button(
                    action: {
                        print("자산추가버튼 tapped")
                    },
                    label: {
                        Image(systemName: "plus")
                        Text("자산추가")
                            .font(.system(size: 12))
            }))
            .accentColor(.black)
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
    }
    
    
}

struct NavigationBarWithButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Color.gray.edgesIgnoringSafeArea(.all)
//                .NavigationBarWithButton
        }
    }
}
