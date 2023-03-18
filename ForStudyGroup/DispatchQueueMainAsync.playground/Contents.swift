import UIKit

var greeting = "Hello, playground"

func play() {
    print("Red")
    print("Yellow")
    print("Green")
    print("Blue")
}

func play2() {
    DispatchQueue.main.async {
        print("Red")
    }
    DispatchQueue.main.async {
        print("Yellow")
    }
    DispatchQueue.main.async {
        print("Green")
    }
    DispatchQueue.main.async {
        print("Blue")
    }
}

play2()
