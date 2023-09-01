import UIKit

var counter = 0

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    for i in 1...3 {
        counter = i
        print("\(counter)")
    }
}

for i in 4...6 {
    counter = i
    print("\(counter)")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    counter = 9
    print("\(counter)")
}
