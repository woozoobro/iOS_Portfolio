//
//  UserProfileSettings.swift
//  EnvironmentObject
//
//  Created by 우주형 on 2023/01/03.
//

import Foundation

final class UserProfileSettings: ObservableObject {
    @Published var name: String = ""
    @Published var age: Int = 0
    
    func haveBirthDayParty() {
        age += 1
    }
}
