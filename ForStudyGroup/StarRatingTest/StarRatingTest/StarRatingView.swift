//
//  StarRatingView.swift
//  StarRatingTest
//
//  Created by 우주형 on 2023/04/01.
//

import SwiftUI

/*
 Image(systemName: "star")
 Image(systemName: "star.fill")
 Image(systemName: "star.leadinghalf.fill")
 */

struct StarRatingView: View {
    @State private var value: Double = 0.0
    
    var fullStarCount: Int {
        Int(value)
    }
    var hasHalfStar: Bool {
        value.truncatingRemainder(dividingBy: 1) != 0
    }
    
    var body: some View {
        VStack {
            Slider(value: $value, in: 0...5, step: 0.5)
            
            Text("\(value)")
            starRatings2
        }
    }
}

extension StarRatingView {
    private var starRatings: some View {
        ZStack {
            HStack {
                if value == 0.5 {
                    Image(systemName: "star.leadinghalf.fill")
                } else if value == 1 {
                    Image(systemName: "star.fill")
                } else if value == 1.5 {
                    Image(systemName: "star.fill")
                    Image(systemName: "star.leadinghalf.fill")
                } else if value == 2 {
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                } else if value == 2.5 {
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.leadinghalf.fill")
                } else if value == 3.0 {
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                } else if value == 3.5 {
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.leadinghalf.fill")
                } else if value == 4.0 {
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                } else if value == 4.5 {
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.leadinghalf.fill")
                } else if value == 5.0 {
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                }
            }
        }
    }
    
    private var starRatings2: some View {
        HStack {
            ForEach(0..<fullStarCount, id: \.self) { star in
                Image(systemName: "star.fill")
            }
            if hasHalfStar {
                Image(systemName: "star.leadinghalf.fill")
            }
        }
    }
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView()
    }
}
