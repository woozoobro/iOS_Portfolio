//
//  ReferenceTypeStateView.swift
//  WooZooSwiftUI
//
//  Created by 우주형 on 2023/07/25.
//

import SwiftUI

class ReferenceTypeStateViewModel: ObservableObject {
    @Published var title: String = "아무 제목"
    
    func titleTapped() {
        self.title = "탭이 됐어용"
        print(title)
    }
}

struct ReferenceTypeStateView: View {
    @StateObject var vm = ReferenceTypeStateViewModel()
        
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    KyleView()
                } label: {
                    Text(vm.title)
                }
            }
            .environmentObject(vm)
        }
    }
}


struct KyleView: View {
    @EnvironmentObject var vm: ReferenceTypeStateViewModel
    var body: some View {
        NavigationLink {
            INUCView()
        } label: {
            Text("타이틀")
        }
    }
}

struct INUCView: View {
    @EnvironmentObject var vm: ReferenceTypeStateViewModel
    var body: some View {
        Text("이누씨")
    }
}

struct ReferenceTypeStateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReferenceTypeStateView()
                .environmentObject(ReferenceTypeStateViewModel())
        }
    }
}
