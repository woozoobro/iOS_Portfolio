//
//  ProfileViewModel.swift
//  Mandarin2
//
//  Created by 우주형 on 2023/04/26.
//

import Foundation
import PhotosUI
import SwiftUI

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published private(set) var userStore: UserStore
    @Published var userImageURL: URL?
    @Published var userImageLoading: Bool = false    
    @Published var usernameTextField: String = ""
    @Published var checkNameSuccess: Bool = false
    @Published var successNameAlert: String = ""
    @Published var showEditProfileView: Bool = false
    
    @Published var selectedItem: PhotosPickerItem? = nil
    
    @Published var userJobs: [String] = ["취준생", "직장인", "현업자"]
    @Published var userTeammateLevel: [String] = [
        "경험 차이 나도 상관 없음", "비슷하면 좋겠지만 초보자도 상관 없음", "나보다 경험이 많았으면 좋겠음"
    ]
    @Published var userStyles: [String] = ["리더형", "팔로우형", "둘 다"]
    @Published var selectedJob: String? = nil
    @Published var selectedMyLevel: Int? = nil
    @Published var selectedTeamLevel: String? = nil
    @Published var selectedUserStyle: String? = nil
    @Published var selectedTimeSlots: [String: [String]] = [:]
    
    init(userStore: UserStore) {
        self.userStore = userStore
        self.getCurrentProfileImageURL()
    }
    
    func getUserFromStore() {
        if userStore.user == nil {
            Task {
                try await userStore.loadCurrentUser()
            }
        }
    }
    
    //MARK: - Update Username
    func updateUsername() {
        guard
            let user = userStore.user, user.username != usernameTextField,
            usernameTextField.count < 15,
            !usernameTextField.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        else { checkUpdateNameIsValid(); return }
        
        Task {
            try await UserManager.shared.updateUsername(userId: user.userId, username: usernameTextField)
            try await userStore.loadCurrentUser()
            successNameAlert = "수정 완료"
            updateNameAnimation()
        }
    }
    
    private func checkUpdateNameIsValid() {
        if usernameTextField.count >= 15 {
            successNameAlert = "닉네임이 길어요"
            updateNameAnimation()
          return
        } else if userStore.user?.username == usernameTextField {
            successNameAlert = "닉네임이 같아요"
            updateNameAnimation()
            return
        } else {
            successNameAlert = "수정 실패"
            updateNameAnimation()
            return
        }
    }
    
    private func updateNameAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.checkNameSuccess = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                self.checkNameSuccess = false
            }
        }
    }
    
    func isThereUsername() {
        if let username = userStore.user?.username {
            usernameTextField = username
        } else {
            usernameTextField = ""
        }
    }
    
    //MARK: - Profile 업뎃
    func getCurrentProfileImageURL() {
        guard let user = userStore.user,
              let urlString = user.profileImagePathUrl else { return }
        self.userImageURL = URL(string: urlString)
    }
    
    func saveProfileImage(item: PhotosPickerItem) {
        guard let user = userStore.user else { return }
        
        Task {
            userImageLoading = true
            guard let data = try await item.loadTransferable(type: Data.self) else { return }
            let (path, name) = try await StorageManager.shared.saveImage(data: data, userId: user.userId)
            print("Success!")
            print(path)
            print(name)
            let url = try await StorageManager.shared.getUrlForImage(path: path)
            self.userImageURL = url
            try await UserManager.shared.updateUserProfileImagePath(userId: user.userId, path: path, url: url.absoluteString)
            try await userStore.loadCurrentUser()
            if let user = userStore.user {
                userImageLoading = false
                try await PostsManager.shared.updateUserProfileURL(userId: user.userId, profileURL: user.profileImagePathUrl ?? "No Profile")
//                try await PostsManager.shared.updateUserProfileURLInComment(userId: user.userId, profileURL: user.profileImagePathUrl ?? "No Profile")
            }
        }
    }
    
    func deleteProfileImage() {
        guard let user = userStore.user, let path = user.profileImagePath else { return }
        
        Task {
            try await StorageManager.shared.deleteImage(path: path)
            try await UserManager.shared.updateUserProfileImagePath(userId: user.userId, path: nil, url: nil)
            print("---> Delete Profile Image Called")
        }
    }
    
    func addUserNeeds() async throws {
        guard let user = userStore.user else { return }
        let userNeeds = UserNeeds(userId: user.userId, job: selectedJob ?? "noJob", myExperience: selectedMyLevel ?? -1, teammateExperience: selectedTeamLevel ?? "noTeam", myStyle: selectedUserStyle ?? "noStyle", workTime: selectedTimeSlots)
        
        try await UserManager.shared.addUserNeeds(userId: user.userId, userNeeds: userNeeds)
        try await userStore.loadCurrentUser()
    }        
    
    func disableApplyButton() -> Bool {
        selectedJob == nil || selectedMyLevel == nil || selectedTeamLevel == nil || selectedUserStyle == nil || userStore.user == nil || userStore.user?.username == nil
    }
            
}

enum ApplyError: Error {
    case userNotLoaded
    case styleNotSelected
    case alreadyApplied
    case projectCapacityFull
    case unknownError
}
