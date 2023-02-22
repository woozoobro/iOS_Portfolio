//
//  ContentView.swift
//  DownloadingImages
//
//  Created by 우주형 on 2023/02/23.
//

import SwiftUI

struct DownloadingImagesView: View {
    @StateObject var vm = DownloadingImagesViewModel()
        
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray) { model in
                    DownloadingImagesRow(model: model)
                }
            }
            .navigationTitle("Downloading Images")
        }
    }
}

struct DownloadingImagesView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImagesView()
    }
}
