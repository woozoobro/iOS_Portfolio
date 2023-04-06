//
//  UnitTestingBootcampView.swift
//  SwiftfulThinkingMaster
//
//  Created by 우주형 on 2023/04/06.
//

/*
 1. Unit Tests
 - test the business logic in my app
 
 2. UI Tests
 - tests the UI of your app
 */

import SwiftUI

struct UnitTestingBootcampView: View {
    @StateObject private var vm: UnitTestingBootcampViewModel
    
    init(isPremium: Bool) {
        _vm = StateObject(wrappedValue: UnitTestingBootcampViewModel(isPremium: isPremium))
    }
    
    var body: some View {
        Text(vm.isPremium.description)
    }
}

struct UnitTestingBootcampView_Previews: PreviewProvider {
    static var previews: some View {
        UnitTestingBootcampView(isPremium: true)
    }
}
