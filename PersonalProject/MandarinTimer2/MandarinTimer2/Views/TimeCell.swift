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
            Image(systemName: "doc.append.fill")
                .foregroundColor(.purple)
                .font(.largeTitle)
            Text(time.passedTime)
        }
    }
}

struct TimeCell_Previews: PreviewProvider {
    static var previews: some View {
        TimeCell(time: TimeModel(fullDate: "2023-04-01 00:01:01", passedTime: "2시간"))
    }
}
