//
//  ContentView.swift
//  FileManagerTest
//
//  Created by 우주형 on 2023/02/21.
//

import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    let folderName = "MyApp_Images"
    init() {
        createFolderIfNeeded()
    }
    
    func createFolderIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path() else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true)
                print("Successfully created folder")
            } catch let error {
                print("Error creating folder \(error)")
            }
        }
    }
    
    func deleteFolder() {
        guard let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else { return }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Success deleting folder")
        } catch let error {
            print("Error deleting folder. \(error)")
        }
    }
    
    func saveImage(image: UIImage, name: String) -> String {
        createFolderIfNeeded()
        guard
            let data = image.jpegData(compressionQuality: 1.0),
            let path = getPathForImage(name: name) else {
            return "Error getting path."
        }
        
        do {
            try data.write(to: path)
            return "Successfully saved."
        } catch let error {
            return "Error saving. \(error)"
        }
    }
    
    func deleteImage(name: String) -> String {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path)
        else { return "Error getting path"}
        
        do {
            try FileManager.default.removeItem(atPath: path)
            return "Successfully deleted"
        } catch let error {
            return "Error deleting file. \(error)"
        }
    }
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            print("Error getting path.")
            return nil
        }
        
        return UIImage(contentsOfFile: path)
    }
    
    func getPathForImage(name: String) -> URL? {
        guard let path = FileManager
            .default.urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
            .appendingPathComponent("\(name).jpg") else {
        print("Error getting path.")
        return nil
        }
        return path
    }
}

class FileMangerTestViewModel: ObservableObject {
    let manager = LocalFileManager.instance
    
    @Published var image: UIImage? = nil
    let imageName = "steve-jobs"
    @Published var infoMessage: String = ""
    
    init() {
//        getImageFromAssetsFoler()
        getImageFromFileManager()
    }
    
    func getImageFromAssetsFoler() {
        image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func saveImage() {
        guard let image = image else { return }
        infoMessage = manager.saveImage(image: image, name: imageName)
    }
    
    func deleteImage() {
        infoMessage = manager.deleteImage(name: imageName)
        manager.deleteFolder()
    }
}

struct FileManagerTest: View {
    @StateObject var vm = FileMangerTestViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                
                HStack {
                    Button {
                        vm.saveImage()
                    } label: {
                        Text("Save to FM")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background { Color.blue.cornerRadius(10) }
                    }
                    
                    Button {
                        vm.deleteImage()
                    } label: {
                        Text("Delete from FM")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background { Color.red.cornerRadius(10) }
                    }
                    Button {
                        vm.getImageFromAssetsFoler()
                    } label: {
                        Text("Asset Folder")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background { Color.green.cornerRadius(10) }
                    }
                }
                
                Text(vm.infoMessage)
                    .font(.largeTitle)
                    .foregroundColor(.purple)
                
                Spacer()
            }
            .navigationTitle("FileManager")
        }
    }
}

struct FileManagerTest_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerTest()
    }
}
