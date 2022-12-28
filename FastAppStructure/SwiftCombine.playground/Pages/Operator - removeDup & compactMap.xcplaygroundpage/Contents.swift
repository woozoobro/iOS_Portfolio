import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

//MARK: - removeDuplicates
let words = "hey hey there! Mr Mr ?"
    .components(separatedBy: " ")
    .publisher

// 기존엔 let subcription = words. 이런 식으로 진행을 했지만
// 지금처럼 subscriptions라는 통을 전역으로 설정하고
// .store을 사용해서 저장 시키는 것도 가능
words
    .removeDuplicates()
    .sink { value in
        print(value)
    }.store(in: &subscriptions)

//MARK: - compactMap : 실제로 가능한 것들만 뽑아주는 거, nil은 제외시키는 거
let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher

strings
    .compactMap { Float($0) }
    .sink { value in
        print(value)
    }.store(in: &subscriptions)

//MARK: - ignoreOutput
let numbers = (1...10_000).publisher

numbers
    .ignoreOutput()
    .sink(receiveCompletion: { print("Completed with: \($0)")}, receiveValue: { print($0)})
    .store(in: &subscriptions)

//MARK: - prefix 앞에 몇개까지만 받겠다

let tens = (1...10).publisher

tens
    .prefix(2)
    .sink(receiveCompletion: { print("Completed with: \($0)")}, receiveValue: { print($0) })
    .store(in: &subscriptions)
