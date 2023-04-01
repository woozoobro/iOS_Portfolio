
import Foundation
import Combine

class UserStore: ObservableObject {
  @Published var currentUserInfo: UserInfo?
}
