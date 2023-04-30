//
//  CloudKitUserBootcamp.swift
//  SwiftfulThinkingMaster
//
//  Created by 우주형 on 2023/04/16.
//

import SwiftUI
import Combine

class CloudKitUserBootcampViewModel: ObservableObject {
    @Published var permissionStatus: Bool = false
    @Published var isSignedInToiCloud: Bool = false
    @Published var error: String = ""
    @Published var userName: String = ""
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getiCloudStatus()
        requestPermission()
        getCurrentUserName()
    }
    
    private func getiCloudStatus() {
        CloudKitUtility.getiCloudStatus()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.error = error.localizedDescription
                }
            } receiveValue: { [weak self] success in
                self?.isSignedInToiCloud = success
            }
            .store(in: &cancellables)
        
//        CloudKitUtility.getiCloudStatus { [weak self] completion in
//            DispatchQueue.main.async {
//                switch completion {
//                case .success(let success):
//                    self?.isSignedInToiCloud = success
//                case .failure(let error):
//                    self?.error = error.localizedDescription
//                }
//            }
//        }
    }
    
    func requestPermission() {
        CloudKitUtility.requestApplicationPermission()
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] success in
                self?.permissionStatus = success
            }
            .store(in: &cancellables)
    }
    
    func getCurrentUserName() {
        CloudKitUtility.discoverUserIdentity()
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] returnedName in
                self?.userName = returnedName
            }
            .store(in: &cancellables)
    }
    
}

struct CloudKitUserBootcamp: View {
    @StateObject private var vm = CloudKitUserBootcampViewModel()
    var body: some View {
        VStack {
            Text("Is Signed In: \(vm.isSignedInToiCloud.description)")
            Text(vm.error)
            Text("Permission: \(vm.permissionStatus.description)")
            Text("Name: \(vm.userName)")
        }        
    }
}

struct CloudKitUserBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitUserBootcamp()
    }
}
