

import SwiftUI

struct UserView: View {
  @State private var userName = ""
  @State private var favoriteGenre = ""
  @Environment(\.presentationMode) var dismiss

   var body: some View {
     NavigationView {
       Form {
         Section(header: Text("User")) {
           // 2
           
           TextField("User Name", text: $userName)
         }
         Section {
           GenrePicker(genre: $favoriteGenre)
         } header: {
           Text("Favorite Genre")
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
   }

   // 4
   func updateUserInfo() {
     dismiss.wrappedValue.dismiss()
   }
}

struct UserView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      UserView()
    }
  }
}
