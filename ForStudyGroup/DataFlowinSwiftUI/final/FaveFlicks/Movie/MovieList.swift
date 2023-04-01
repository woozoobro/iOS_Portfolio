

import SwiftUI

// swiftlint:disable multiple_closures_with_trailing_closure
struct MovieList: View {
  @EnvironmentObject var userStore: UserStore
  @StateObject var movieStore = MovieStore()
  @State private var isPresented = false

  var body: some View {
    NavigationView {
      List {
        ForEach(movieStore.movies, id: \.title) {
          MovieRow(movie: $0)
        }
        .onDelete(perform: movieStore.deleteMovie)
      }
      .sheet(isPresented: $isPresented) {
        AddMovie(movieStore: movieStore, showModal: $isPresented)
      }
      .navigationBarTitle(Text("Fave Flicks"))
      .navigationBarItems(
        leading:
          NavigationLink(destination: UserView()) {
            HStack {
              // 1
              userStore.currentUserInfo.map { Text($0.userName) }
              // 2
              Image(systemName: "person.fill")
            }
          },
        trailing:
          Button(action: { isPresented.toggle() }) {
            Image(systemName: "plus")
          }
      )
    }
  }
}

struct MovieList_Previews: PreviewProvider {
  static var previews: some View {
    MovieList(movieStore: MovieStore())
      .environmentObject(UserStore())
  }
}
