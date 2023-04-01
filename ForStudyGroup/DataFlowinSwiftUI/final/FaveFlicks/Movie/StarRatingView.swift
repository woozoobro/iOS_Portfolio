import SwiftUI

/*
Image(systemName: "star")
Image(systemName: "star.fill")
Image(systemName: "star.leadinghalf.filled")
*/

struct StarRatingView: View {
  @State var value: Double = 0.0
    var body: some View {
      VStack {
        Slider(value: $value, in: 0...5, step: 0.5) { _ in
          
        }
        HStack {
          Image(systemName: "star")
          Image(systemName: "star")
          Image(systemName: "star")
          Image(systemName: "star")
          Image(systemName: "star")
        }
      }
    }
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView()
    }
}
