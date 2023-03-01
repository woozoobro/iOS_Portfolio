//
//  InstagramLogo.swift
//  TextFactor
//
//  Created by 우주형 on 2023/03/01.
//

import SwiftUI

struct InstagramLogo: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(RadialGradient(colors: [Color.], center: <#T##UnitPoint#>, startRadius: <#T##CGFloat#>, endRadius: <#T##CGFloat#>))
            .frame(width: 200, height: 200)
            
    }
}

struct InstagramLogo_Previews: PreviewProvider {
    static var previews: some View {
        InstagramLogo()
    }
}
