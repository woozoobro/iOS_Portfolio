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
    let passThroughPublisher = PassthroughSubject<Int?, Error>()
    
    init() {
        publishFakeData()
    }
    
    private func publishFakeData() {
        let items: [Int] = Array(1..<11)
        
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
                self.passThroughPublisher.send(items[x])
                
                if x == items.indices.last {
                    self.passThroughPublisher.send(completion: .finished)
                }
            }
        }
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
            //.tryMap({ int in
            //    if int == 5 {
            //        throw URLError(.badServerResponse)
            //    }
            //    return String(int)
            //})
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
            
            .replaceNil(with: 5)
        
            .map({ String($0) })
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
