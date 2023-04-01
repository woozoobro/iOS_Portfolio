

import SwiftUI

struct UserView: View {
  // 1
  @State private var userName = ""
  @State private var favoriteGenre = ""
  @EnvironmentObject var userStore: UserStore
  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("User")) {
          // 2
          TextField("User Name", text: $userName)
        }
        Section(header: Text("Favorite Genre")) {
          GenrePicker(genre: $favoriteGenre)
        }
      }
    }
    // 3
    .navigationBarTitle(Text("\(userName) Info"), displayMode: .inline)
    .navigationBarItems(
      trailing:
        Button(action: updateUserInfo) {
          Text("Update")
        }
    )
    .onAppear {
      userName = userStore.currentUserInfo?.userName ?? ""
      favoriteGenre = userStore.currentUserInfo?.favoriteGenre ?? ""
    }
  }

  // 4
  func updateUserInfo() {
    let newUserInfo = UserInfo(userName: userName, favoriteGenre: favoriteGenre)
    userStore.currentUserInfo = newUserInfo
    presentationMode.wrappedValue.dismiss()
  }
}
