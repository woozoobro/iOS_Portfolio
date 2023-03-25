//
//  TimeCell.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/19.
//

import SwiftUI

struct TimeCell: View {
    
    let time: TimeModel
    
    var body: some View {
        VStack {
            Text(time.justDate)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 40, height: 40)
                .foregroundColor(.purple)
                .font(.largeTitle)
            Text(time.studySeconds.countToShortTime())
                .font(.callout)
        }        
    }
}

struct TimeCell_Previews: PreviewProvider {
    static var previews: some View {
        TimeCell(time: dev.timeModel)
    }
}
