import UIKit

struct Fruit {
    let name: String
}

let fruitArray: [Fruit] = [
    Fruit(name: "apple"),
    Fruit(name: "banana"),
    Fruit(name: "peaches")
]
    

let newArray = fruitArray.filter { fruit  in
    return fruit.name.contains("ap")
}

for fruit in fruitArray {
    print(fruit.name)
}
print("_____")

for fruit in newArray {
    print(fruit.name)
}
