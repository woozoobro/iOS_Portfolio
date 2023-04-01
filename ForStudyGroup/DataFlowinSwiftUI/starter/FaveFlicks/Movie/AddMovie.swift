
import SwiftUI

struct AddMovie: View {
  static let defaultMovieTitle = "An untitled masterpiece"
  static let defaultMovieGenre = Movie.possibleGenres.first ?? "Genre-buster"

  let movieStore: MovieStore
  @Binding var showModal: Bool
  @State private var title = ""
  @State private var genre = ""
  @State private var rating: Double = 0

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Title")) {
          TextField("Title", text: $title)
        }
        Section(header: Text("Genre")) {
          GenrePicker(genre: $genre)
        }
        Section(header: Text("Rating")) {
          Slider(value: $rating, in: 0...5, step: 0.5)
          RatingView(rating: rating)
        }
      }
      .navigationBarTitle(Text("Add Movie"), displayMode: .inline)
      .navigationBarItems(
        trailing:
          Button(action: addMovie) {
            Text("Add")
          }
      )
    }
  }

  private func addMovie() {
    movieStore.addMovie(
      title: title.isEmpty ? AddMovie.defaultMovieTitle : title,
      genre: genre.isEmpty ? AddMovie.defaultMovieGenre : genre,
      rating: rating)

    showModal.toggle()
  }
}


struct AddMovie_Previews: PreviewProvider {
    static var previews: some View {
      AddMovie(movieStore: MovieStore(), showModal: .constant(false))
    }
}
