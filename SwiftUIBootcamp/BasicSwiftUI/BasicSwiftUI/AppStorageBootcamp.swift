//
//  AppStorageBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/19.
//

import SwiftUI

struct AppStorageBootcamp: View {
    
    @AppStorage("name") var currentUserName: String?
    //@State var currentUserName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUserName ?? "Add Name Here")
            
            if let name = currentUserName {
                Text(name)
            }
            
            Button("Save".uppercased()) {
                let name = "Emily"
                currentUserName = name
                //UserDefaults.standard.set(name, forKey: "user")
            }
        }
//        .onAppear {
//            currentUserName = UserDefaults.standard.string(forKey: "user")
//        }
    }
}

struct AppStorageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBootcamp()
    }
}
