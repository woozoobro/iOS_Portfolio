//
//  TrafficLight.swift
//  HappySunday
//
//  Created by 우주형 on 2023/03/26.
//

import SwiftUI

struct TrafficLight: View {
    
    enum TrafficColor: String {
        case green
        case yellow
        case red
        
        var checkColor: Color {
            switch self {
            case .green:
                return Color.green
            case .yellow:
                return Color.yellow
            case .red:
                return Color.red
            }
        }
    }
    
    @State var trafficColor: TrafficColor = .green
    @State var checkCount: Int = 0
    
    var body: some View {
        
        VStack(spacing: 20) {
            Circle()
                .fill(checkCount == 1 ? trafficColor.checkColor : Color.gray )
                .scaleEffect(checkCount == 1 ? 1.2 : 1.0)
                .frame(width: 100)
            
            Circle()
                .fill(checkCount == 2 ? trafficColor.checkColor : Color.gray )
                .scaleEffect(checkCount == 2 ? 1.2 : 1.0)
                .frame(width: 100)
            
            Circle()
                .fill(checkCount == 3 ? trafficColor.checkColor : Color.gray )
                .scaleEffect(checkCount == 3 ? 1.2 : 1.0)
                .frame(width: 100)
            
            HStack {
                Button {
                    withAnimation(.spring()) {
                        checkCount = 1
                        trafficColor = .green
                    }
                } label: {
                    Text("초록")
                }
                
                Button {
                    withAnimation(.spring()) {
                        checkCount = 2
                        trafficColor = .yellow
                    }
                } label: {
                    Text("노랑")
                }
                
                Button {
                    withAnimation(.spring()) {
                        checkCount = 3
                        trafficColor = .red
                    }
                } label: {
                    Text("빨강")
                        
                }
            }
            .fontWeight(.bold)
        }
    }
}

struct TrafficLight_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLight()
    }
}
