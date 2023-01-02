//
//  FrameworkDetailView.swift
//  AppleFramework_SwiftUI
//
//  Created by 우주형 on 2023/01/03.
//

import SwiftUI

struct FrameworkDetailView: View {
    @StateObject var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Image(viewModel.framework.imageName)
                .resizable()
                .frame(width: 100, height: 100)
            Text(viewModel.framework.name)
                .font(.system(size: 24, weight: .bold, design: .default))
            Text(viewModel.framework.description)
                .font(.system(size: 16, weight: .regular, design: .default))
           Spacer()
            Button {
                print("Safari 띄우기")
                viewModel.isSafariPresented = true
            } label: {
                Text("Learn More")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(.teal)
            .cornerRadius(40)
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
        .sheet(isPresented: $viewModel.isSafariPresented) {
            let url = URL(string: viewModel.framework.urlString)!
            SafariView(url: url)
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = FrameworkDetailViewModel(framework: AppleFramework.list[0])
        FrameworkDetailView(viewModel: vm)
    }
}
