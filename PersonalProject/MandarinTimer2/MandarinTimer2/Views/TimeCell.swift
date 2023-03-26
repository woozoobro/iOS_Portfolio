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
            RoundedRectangle(cornerRadius: 15)
                .font(.largeTitle)
                .frame(width: 40, height: 40)
                .foregroundStyle(time.timeGradientColor)
                .shadow(color: time.timeColor, radius: time.shadowAmount, x: 0, y: 1)
                
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
