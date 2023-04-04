//
//  ProtocolsBootcamp.swift
//  SwiftfulThinkingMaster
//
//  Created by 우주형 on 2023/04/04.
//

import SwiftUI

struct DefaultColorTheme {
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray    
}

struct ProtocolsBootcamp: View {
    
    let colorTheme: DefaultColorTheme = DefaultColorTheme()
    
    var body: some View {
        ZStack {
            colorTheme.tertiary
                .ignoresSafeArea()
            
            Text("Protocols are awesome!")
                .font(.headline)
                .foregroundColor(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(10)
        }
    }
}

struct ProtocolsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ProtocolsBootcamp()
    }
}
