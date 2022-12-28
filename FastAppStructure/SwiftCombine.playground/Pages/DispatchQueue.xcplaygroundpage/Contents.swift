import Foundation


//print("Start")
//DispatchQueue.main.async {
//    for _ in 0...3 {
//        print("async")
//    }
//}
//
//for _ in 0...3 {
//    print("sync")
//}
//print("End")

let concurrentQueue = DispatchQueue.init(label: "WoozooQueue", attributes: .concurrent)
concurrentQueue.sync { print("Start") }
concurrentQueue.async { for _ in 0...3 { print ("async") }}
concurrentQueue.sync { for _ in 0...3 { print ("sync") }}
concurrentQueue.sync { print("End") }
