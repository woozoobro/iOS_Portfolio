//
//  EscapingView.swift
//  HowToUserEscaping
//
//  Created by 우주형 on 2023/04/29.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello, World!"
    
    func getData() {
        downloadData4 { [weak self] returnedResult in
            self?.text = returnedResult.data
        }
    }
    
    private func downloadData() -> String {
        return "Download Data!"
    }
    
    private func downloadData2(completionHandler: @escaping (_ data: String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler("New Data!")
        }
    }
    
    private func downloadData3(completionHandler: @escaping (DownloadResult) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResult(data: "New Data from DownloadResult")
            completionHandler(result)
        }
    }
    
    private func downloadData4(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResult(data: "New Data from DownloadResult")
            completionHandler(result)
        }
    }
    
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> Void

struct EscapingView: View {
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.bold)
            .onTapGesture {
                vm.getData()
            }
    }
}

struct EscapingView_Previews: PreviewProvider {
    static var previews: some View {
        EscapingView()
    }
}
