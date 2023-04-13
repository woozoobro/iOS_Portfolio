//
//  AdvancedCombineBootcamp.swift
//  SwiftfulThinkingMaster
//
//  Created by 우주형 on 2023/04/10.
//

import SwiftUI
import Combine

class AdvancedCombineDataService {
    //@Published var basicPublisher: String = "first publish"
//    let currentValuePublisher = CurrentValueSubject<Int, Error>("first publish")
    let passThroughPublisher = PassthroughSubject<Int, Error>()
    let boolPublisher = PassthroughSubject<Bool, Error>()
    
    init() {
        publishFakeData()
    }
    
    private func publishFakeData() {
        let items: [Int] = Array(1..<11)
        
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
                self.passThroughPublisher.send(items[x])
                
                if (x > 4 && x < 8) {
                    self.boolPublisher.send(true)
                } else {
                    self.boolPublisher.send(false)
                }
                
                if x == items.indices.last {
                    self.passThroughPublisher.send(completion: .finished)
                }
            }
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
//            self.passThroughPublisher.send(1)
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.passThroughPublisher.send(2)
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//            self.passThroughPublisher.send(3)
//        }
    }
}

class AdvancedCombineBootcampViewModel: ObservableObject {
    
    @Published var data: [String] = []
    @Published var error: String = ""
    
    let dataService = AdvancedCombineDataService()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.passThroughPublisher
        
            // Sequence Operations
            /*
                //.first()
                //.first(where: { $0 > 4})
                //.tryFirst(where: { int in
                //    if int == 3 {
                //        throw URLError(.badServerResponse)
                //    }
                //    return int > 1
                //})
                //.last()
                //.last(where: { $0 > 4 })
                //.tryLast(where: { int in
                //    if int == 13 {
                //        throw URLError(.badServerResponse)
                //    }
                //    return int > 1
                //})
                //.dropFirst()
                //.dropFirst(3)
                //.drop(while: { $0 < 5 })
                //.tryDrop(while: { int in
                //    if int == 15 {
                //        throw URLError(.badServerResponse)
                //    }
                //    return int < 6
                //})
                //.prefix(4)
                //.prefix(while: { $0 < 5 })
                //.output(at: 3)
                //.output(in: 2..<4)
            */
        
            // Mathematic Operations
            /*
                //.max()
                //.max(by: { int1, int2 in
                //    return int1 < int2
                //})
                //.tryMax(by: )
                //.min(by: )
                //.tryMin(by: )
            */
        
            // Filter / Reducing Operations
            /*
    //            .tryMap({ int in
    //                if int == 5 {
    //                    throw URLError(.badServerResponse)
    //                }
    //                return String(int)
    //            })
                //.compactMap({ int in
                //    if int == 5 {
                //        return nil
                //    }
                //    return String(int)
                //})
                //.tryCompactMap()
                
                //.filter{ ($0 > 3)  && ($0 < 7 ) }
                //.tryFilter()
                //.removeDuplicates()
                //.removeDuplicates(by: { int1, int2 in
                //    return int1 == int2
                //})
                //.tryRemoveDuplicates(by: )
                
                //.replaceNil(with: 5)
                //.replaceEmpty(with: 5)
                //.replaceError(with: "Default Value")
                //.scan(0, { existingValue, newValue in
                //    return existingValue + newValue
                //})
                //.scan(0, +)
                //.tryScan(, )
                //.reduce(0, { existingValue, newValue in
                //    return existingValue + newValue
                //})
                //.reduce(0, +)
                //.collect()
                //.collect(3)
                //.allSatisfy({ $0 < 50 })
            */
        
            // Timing Operations
            /*
                //.debounce(for: 0.75, scheduler: DispatchQueue.main)
                //.delay(for: 2, scheduler: DispatchQueue.main)
                //.measureInterval(using: DispatchQueue.main)
                //.map({ stride in
                //    return "\(stride.timeInterval)"
                //})
                //.throttle(for: 10, scheduler: DispatchQueue.main, latest: true)
                //.retry(3)
                //.timeout(0.75, scheduler: DispatchQueue.main)
            */
        
            // Multiple Publishers / Subscribers
            .combineLatest(dataService.boolPublisher)
            //.compactMap({ (int, bool) in
            //    if bool {
            //        return String(int)
            //    }
            //    return nil
            //})
            .compactMap({ $1 ? String($0) : nil})
            .removeDuplicates()
            //.map({ String($0) })
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = "Error: \(error.localizedDescription)"
                    print("Error: \(error.localizedDescription)")
                    break
                }
            } receiveValue: { [weak self] returnedValue in
//                self?.data.append(contentsOf: returnedValue)
                self?.data.append(returnedValue)
            }
            .store(in: &cancellables)
    }
    
}

struct AdvancedCombineBootcamp: View {
    
    @StateObject private var vm = AdvancedCombineBootcampViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.data, id: \.self) {
                    Text($0)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                if !vm.error.isEmpty {
                    Text(vm.error)
                }
            }
        }
    }
}

struct AdvancedCombineBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedCombineBootcamp()
    }
}
