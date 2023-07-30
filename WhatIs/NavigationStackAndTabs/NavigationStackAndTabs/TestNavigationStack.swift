//
//  TestNavigationStack.swift
//  NavigationStackAndTabs
//
//  Created by 우주형 on 2023/07/18.
//

import SwiftUI

struct TestNavigationStack: View {
    let appleProducts = ["Mac", "Macbook", "iPhone", "iPad"]
    @State private var stackPath: NavigationPath = .init()
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            List(appleProducts, id: \.self) { product in
                Button {
                    stackPath.append(product)
                } label: {
                    Text(product)
                        .font(.largeTitle)
                        .bold()
                }
                
                Button {
                    stackPath.append(1)
                } label: {
                    Text("넘버로 네비게이션")
                }
            }
            .navigationTitle("네비게이션 스택")
            .navigationDestination(for: String.self) { product in
                AppleProductView(product: product, path: $stackPath)
            }
            .navigationDestination(for: Int.self) { number in
                Text("넘버가 선택되었습니다")
            }
        }
    }
}

struct AppleProductView: View {
    let product: String
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 20) {
            Text(product)
                .font(.largeTitle)
                .onTapGesture {
                    path.append("세번째 혹은 더 깊이")
                }
            
            Text("모두 없애버리기")
                .onTapGesture {
                    path = .init()
                }
        }
    }
}

struct TestNavigationStack_Previews: PreviewProvider {
    static var previews: some View {
        TestNavigationStack()
    }
}
