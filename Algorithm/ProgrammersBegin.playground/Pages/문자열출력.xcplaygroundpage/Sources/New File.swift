import Foundation

let str = readLine()!
let result = str.map { character -> Character in
    if character.isUppercase {
        return character.lowercased()
    } else {
        return character.uppercased()
    }
}
print(result)
