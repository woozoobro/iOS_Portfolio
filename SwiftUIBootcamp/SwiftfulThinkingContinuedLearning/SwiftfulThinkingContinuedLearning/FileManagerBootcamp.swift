//
//  FileManagerBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by 우주형 on 2023/02/20.
//

import SwiftUI

class FileManagerViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let imageName: String = "steve-jobs"
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
}

struct FileManagerBootcamp: View {
    
    @StateObject var vm = FileManagerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200,height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                
                Button {
                    
                } label: {
                    
                }

                
                Spacer()
                    
            }
            .navigationTitle("File Manager")
        }
    }
}

struct FileManagerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerBootcamp()
    }
}
