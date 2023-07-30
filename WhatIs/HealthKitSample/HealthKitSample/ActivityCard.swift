//
//  ActivityCard.swift
//  HealthKitSample
//
//  Created by 우주형 on 2023/07/29.
//

import SwiftUI

struct Activity {
    let id: Int
    let title: String
    let subtitle: String
    let image: String
    let amount: String
}

extension Activity {
    static let sample = Activity(id: 0, title: "Daily steps", subtitle: "Goa: 10,000", image: "figure.walk", amount: "6,545")
}

struct ActivityCard: View {
    @State var activity: Activity
    
    var body: some View {
        ZStack {
            Color(.green).blendMode(.lighten)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                .blur(radius: 0.2)
            VStack(spacing: 10) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(activity.subtitle)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(activity.title)
                            .font(.body)                        
                    }
                    
                    Spacer()
                    Image(systemName: activity.image)
                        .foregroundColor(.green)
                }
                
                Text(activity.amount)
                    .font(.title)
            }
            .padding()
            .cornerRadius(15)
        }
        .shadow(radius: 0.5)
        
    }
}

struct ActivityCard_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCard(activity: Activity(id: 0, title: "Daily steps", subtitle: "Goa: 10,000", image: "figure.walk", amount: "6,545"))
    }
}
