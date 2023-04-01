
import Foundation

class MovieStore: ObservableObject {
  static let moviesKey = "Movies"
  static let defaultMovies = [
    Movie(title: "The Matrix", genre: "Action, Sci-Fi", rating: 4.0),
    Movie(title: "Airplane!", genre: "Comedy", rating: 4.5),
    Movie(title: "The Dark Knight", genre: "Action", rating: 4.5)
  ]

//  static func loadMovies() -> [Movie] {
//    let savedMovies = UserDefaults.standard.object(forKey: MovieStore.moviesKey)
//    if let savedMovies = savedMovies as? Data {
//      let decoder = JSONDecoder()
//      return (try? decoder.decode([Movie].self, from: savedMovies))
//        ?? MovieStore.defaultMovies
//    }
//    return MovieStore.defaultMovies
//  }

  @Published var movies: [Movie] = []

  func addMovie(title: String, genre: String, rating: Double) {
    let newMovie = Movie(title: title, genre: genre, rating: rating)
    movies.append(newMovie)
  }

  func deleteMovie(at offsets: IndexSet) {
    movies.remove(atOffsets: offsets)
  }
//
//  private func persistMovies() {
//    let encoder = JSONEncoder()
//    if let encoded = try? encoder.encode(movies) {
//      UserDefaults.standard.set(encoded, forKey: MovieStore.moviesKey)
//    }
//  }
}
