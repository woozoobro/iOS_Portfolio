//
//  EditProfileView.swift
//  Mandarin2
//
//  Created by 우주형 on 2023/04/06.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @EnvironmentObject var profileVM: ProfileViewModel
    @Binding var showEditProfileView: Bool
    
    @State private var showAlert: Bool = false
    
    @State private var url: URL? = nil
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            EditProfileSectionView()
                .navigationTitle("프로필 수정")
                .navigationBarTitleDisplayMode(.inline)
        }
        .onTapGesture {
            //            UIApplication.shared.endEditing()
        }
        .task {
            if let user = profileVM.userStore.user, let path = user.profileImagePath {
                let url = try? await StorageManager.shared.getUrlForImage(path: path)
                self.url = url
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("취소") {
                    withAnimation(.spring()) {
                        showEditProfileView.toggle()
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("저장") {
                    guard
                        !profileVM.usernameTextField.isEmpty,
                        profileVM.selectedJob != nil && profileVM.selectedMyLevel != nil && profileVM.selectedTeamLevel != nil && profileVM.selectedUserStyle != nil && !profileVM.selectedTimeSlots.isEmpty else {
                        showAlert.toggle()
                        return
                    }
                    Task {
                        try await profileVM.addUserNeeds()
                        showEditProfileView.toggle()
                    }
                }
                .tint(Color.green)
                .alert("실패", isPresented: $showAlert) {
                    
                } message: {
                    Text("저장 실패! 모두 선택되지 않았어요")
                }
                
            }
        }
    }
}

struct EditProfileSectionView: View {
    @EnvironmentObject var profileVM: ProfileViewModel
    @FocusState private var isTextFieldFocused: Bool
    private let buttonHeight: CGFloat = 36
    private let buttonCorner: CGFloat = 13
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                HStack(spacing: 10) {
                    //MARK: - 프로필 이미지
                    PhotosPicker(selection: $profileVM.selectedItem, matching: .images, photoLibrary: .shared()) {
                        profileImage
                    }
                    .onChange(of: profileVM.selectedItem) { newValue in
                        if let newValue {
                            profileVM.deleteProfileImage()
                            profileVM.saveProfileImage(item: newValue)
                        }
                    }
                    Spacer()
                    usernameInputField
                }
                .padding(.horizontal, 30)
                .padding(.top, 30)
                
                //MARK: - 설문조사 섹션
                VStack(alignment: .leading) {
                    //MARK: - 개발 가능 시간
                    VStack {
                        HStack {
                            Text("작업 가능 시간")
                                .padding(.bottom, 15)
                            Spacer()
                            Image(systemName: "goforward")
                                .onTapGesture {
                                    withAnimation {
                                        profileVM.selectedTimeSlots = [:]
                                    }
                                }
                        }
                        .padding(.horizontal, 30)
                        
                        //                        EditWorkTimeView()
                    }
                    .padding(.bottom, 30)
                    
                    Divider()
                    //MARK: - 현재 하는일
                    VStack(alignment: .leading) {
                        Text("현재 하는 일")
                            .padding(.bottom, 15)
                        HStack(spacing: 50) {
                            ForEach(profileVM.userJobs, id: \.self) { job in
                                Text(job)
                                    .padding(10)
                                    .background {
                                        profileVM.selectedJob == job ?
                                        Color.orange.opacity(0.2).cornerRadius(30) :
                                        Color.gray.opacity(0.2).cornerRadius(30)
                                    }
                                    .onTapGesture {
                                        profileVM.selectedJob = job
                                    }
                            }
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding(.vertical, 30)
                    .padding(.horizontal, 30)
                    
                    VStack(alignment: .leading) {
                        Text("나의 개발 경험")
                            .padding(.bottom, 15)
                        HStack {
                            ForEach(1..<6, id: \.self) { index in
                                Spacer()
                                VStack {
                                    Text("\(index)")
                                    Circle()
                                        .frame(width: 30)
                                        .foregroundColor (
                                            profileVM.selectedMyLevel == index ?
                                            Color.orange.opacity(0.2) :
                                                Color.gray.opacity(0.2)
                                        )
                                }
                                .onTapGesture {
                                    profileVM.selectedMyLevel = index
                                }
                                Spacer()
                            }
                        }
                        .padding(.bottom)
                        HStack {
                            Text("거의 없음")
                            Spacer()
                            Text("쫌 침")
                        }
                    }
                    .padding(.bottom, 15)
                    .padding(.horizontal, 30)
                    
                    Text("선호하는 팀원의 경험")
                        .padding(.vertical, 30)
                        .padding(.horizontal, 30)
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(profileVM.userTeammateLevel, id: \.self) { teamLevel in
                            Text(teamLevel)
                                .padding(10)
                                .background {
                                    profileVM.selectedTeamLevel == teamLevel ?
                                    Color.orange.opacity(0.2).cornerRadius(20) :
                                    Color.gray.opacity(0.2).cornerRadius(20)
                                }
                                .onTapGesture {
                                    profileVM.selectedTeamLevel = teamLevel
                                }
                        }
                    }
                    .padding(.bottom, 15)
                    .padding(.horizontal, 30)
                    
                    Text("평소 스타일")
                        .padding(.vertical, 30)
                        .padding(.horizontal, 30)
                    HStack(spacing: 50) {
                        ForEach(profileVM.userStyles, id: \.self) { style in
                            Text(style)
                                .padding(10)
                                .background {
                                    profileVM.selectedUserStyle == style ?
                                    Color.orange.opacity(0.2).cornerRadius(20) :
                                    Color.gray.opacity(0.2).cornerRadius(20)
                                }
                                .onTapGesture {
                                    profileVM.selectedUserStyle = style
                                }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 30)
                    .padding(.horizontal, 30)
                }
                
            }
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(radius: 1)
            }
        }
        .onTapGesture {
            isTextFieldFocused = false
        }
    }
}

extension EditProfileSectionView {
    private var profileImage: some View {
        Image(systemName: "person")
            .overlay {
                if profileVM.userImageLoading {
                    ProgressView()
                }
            }
            .overlay(alignment:.bottomTrailing) {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 30)
                    .overlay {
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                            .font(.body)
                    }
                    .offset(x: 4, y: 4)
            }
        
    }
    
    private var usernameInputField: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("닉네임")
                Spacer()
                Text(profileVM.successNameAlert)
                    .foregroundColor(profileVM.successNameAlert == "수정 완료" ? .green : .pink)
                    .padding(.trailing, 4)
                    .opacity(profileVM.checkNameSuccess ? 1 : 0)
                    .animation(.easeInOut, value: profileVM.checkNameSuccess)
            }
            .padding(.leading)
            
            TextField("익명의 귤", text: $profileVM.usernameTextField)
                .padding(.leading)
                .frame(height: buttonHeight)
                .background {
                    RoundedRectangle(cornerRadius: buttonCorner)
                        .stroke(lineWidth: 1.6)
                        .foregroundStyle(
                            LinearGradient(colors: [Color.orange, Color.green], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                }
                .tint(Color.orange)
                .focused($isTextFieldFocused)
                .overlay(alignment: .trailing) {
                    Image(systemName: "highlighter")
                        .padding(.trailing)
                        .frame(height: 30)
                        .onTapGesture {
                            profileVM.updateUsername()
                            //                            UIApplication.shared.endEditing()
                        }
                        .opacity(profileVM.usernameTextField.isEmpty ? 0 : 1)
                        .animation(.spring(), value: profileVM.usernameTextField.isEmpty)
                }
                .onSubmit {
                    profileVM.updateUsername()
                }
        }
        .onAppear {
            profileVM.isThereUsername()
            if let userNeeds = profileVM.userStore.user?.userNeeds {
                profileVM.selectedJob = userNeeds.job
                profileVM.selectedMyLevel = userNeeds.myExperience
                profileVM.selectedTeamLevel = userNeeds.teammateExperience
                profileVM.selectedUserStyle = userNeeds.myStyle
                profileVM.selectedTimeSlots = userNeeds.workTime
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(showEditProfileView: .constant(false))
    }
}
