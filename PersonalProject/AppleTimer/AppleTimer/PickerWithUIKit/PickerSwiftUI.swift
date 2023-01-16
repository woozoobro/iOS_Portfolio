//
//  PickerSwiftUI.swift
//  AppleTimer
//
//  Created by 우주형 on 2023/01/17.
//

import SwiftUI

struct PickerSwiftUI: View {
    private let data: [[String]] = [
        Array(0..<24).map { "\($0)" },
        Array(0..<60).map { "\($0)" },
        Array(0..<60).map { "\($0)" }
    ]
    
    @State private var selections: [Int] = [0, 0, 0]
    
    var body: some View {
        
        VStack {
            PickerView(data: self.data, selections: self.$selections)
            
            Text("\(self.data[0][self.selections[0]]) \(self.data[1][self.selections[1]]) \(self.data[2][self.selections[2]])")
        }
    }
}

struct PickerSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        PickerSwiftUI()
    }
}
