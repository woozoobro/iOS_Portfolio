
import SwiftUI

struct RatingView: View {
  let rating: Double

  var fullStarCount: Int {
    Int(rating / 1)
  }

  var hasHalfStar: Bool {
    rating.truncatingRemainder(dividingBy: 1) != 0
  }

  var body: some View {
    HStack {
      ForEach(0..<fullStarCount, id: \.self) { _ in
        Image(systemName: "star.fill")
      }
      if hasHalfStar {
        Image(systemName: "star.lefthalf.fill")
      }
    }
    .foregroundColor(.orange)
  }
}

struct RatingView_Previews: PreviewProvider {
  static var previews: some View {
    RatingView(rating: 4.5)
  }
}
