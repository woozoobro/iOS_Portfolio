import UIKit

let s1 = "HelloWorld"

let mapResult = s1.map { $0 }
print(mapResult)



//s1.map { $0.isLowercase ? $0.uppercased() : $0.lowercased() }.joined()
