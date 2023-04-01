

import Combine

// 1
class UserStore: ObservableObject {
  // 2
  @Published var currentUserInfo: UserInfo?
}
