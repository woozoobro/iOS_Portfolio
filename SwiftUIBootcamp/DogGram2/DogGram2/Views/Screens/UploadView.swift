//
//  UploadView.swift
//  DogGram2
//
//  Created by 우주형 on 2023/03/27.
//

import SwiftUI

struct UploadView: View {
    var body: some View {
        VStack(spacing: 0) {
            
            Button {
                
            } label: {
                Text("Take photo".uppercased())
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.MyTheme.yellowColor)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.MyTheme.purpleColor)
            
            Button {
                
            } label: {
                Text("Import photo".uppercased())
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.MyTheme.purpleColor)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.MyTheme.yellowColor)
        }

    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
