

import SwiftUI

struct GenrePicker: View {
  // 1
  @Binding var genre: String

  var body: some View {
    // 2
    Picker(selection: $genre, label: Spacer()) {
      // 3
      ForEach(Movie.possibleGenres, id: \.self) {
        Text($0)
      }
    }
    .pickerStyle(WheelPickerStyle())
  }
}

struct GenrePicker_Previews: PreviewProvider {
  static var previews: some View {
    // 4
    GenrePicker(genre: .constant("Action"))
  }
}
