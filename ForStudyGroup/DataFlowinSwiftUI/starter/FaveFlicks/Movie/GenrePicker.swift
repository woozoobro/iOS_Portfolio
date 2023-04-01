
import SwiftUI

struct GenrePicker: View {
  @Binding var genre: String
    var body: some View {
      Picker("ddd", selection: $genre) {
        ForEach(Movie.possibleGenres, id: \.self) { genre in
          Text(genre)
        }
      }
      .pickerStyle(.wheel)
      
    }
}

struct GenrePicker_Previews: PreviewProvider {
    static var previews: some View {
      GenrePicker(genre: .constant("Action"))
    }
}
