//
//  TrafficLightView.swift
//  SelfPortfolio
//
//  Created by 우주형 on 2023/03/05.
//

import SwiftUI

enum Traffic {
    case red
    case yellow
    case green
}

struct TrafficLightView: View {
    
    @State var traffic: Traffic = .red
    @State var trafficColor: Color = .red
    
    var body: some View {
        VStack {
            Spacer()
            ImageComponentView(color: traffic == .red ? trafficColor : Color.gray)
                .rotationEffect(Angle(degrees: traffic == .red ? 360 : 0))
                .scaleEffect(traffic == .red ? 2.0 : 1.0)
            ImageComponentView(color: traffic == .yellow ? trafficColor : Color.gray)
                .rotationEffect(Angle(degrees: traffic == .yellow ? 360 : 0))
                .scaleEffect(traffic == .yellow ? 2.0 : 1.0)
            ImageComponentView(color: traffic == .green ? trafficColor : Color.gray)
                .rotationEffect(Angle(degrees: traffic == .green ? 360 : 0))
                .scaleEffect(traffic == .green ? 2.0 : 1.0)
            Spacer()
            
            Button {
                withAnimation(.spring()) {
                    changeTraffic()
                }
            } label: {
                Text("신호등 바꾸기")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.white)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(Color.blue.cornerRadius(18))
            }
            Spacer()
        }
    }
    
    func changeTraffic() {
        switch traffic {
        case .red:
            traffic = .yellow
            trafficColor = .yellow
        case .yellow:
            traffic = .green
            trafficColor = .green
        case .green:
            traffic = .red
            trafficColor = .red
        }
    }
}

struct ImageComponentView: View {
    let color: Color
    
    var body: some View {
        Image(systemName: "timelapse")
            .font(.largeTitle)
            .foregroundColor(color)
            .padding()
            .background(
                Circle()
                    .foregroundColor(Color.white)
            )
            .shadow(color: color.opacity(0.25), radius: 10, x: 0, y: 0)
            .padding()
    }
    
}

struct TrafficLightView_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLightView()
            .previewLayout(.sizeThatFits)
    }
}
