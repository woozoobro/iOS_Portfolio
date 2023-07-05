//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by 우주형 on 2023/06/25.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElasped: Int
    let secondsRemaining: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondsElasped + secondsRemaining
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElasped) / Double(totalSeconds)
    }
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            
            HStack {
                VStack(alignment:.leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElasped)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElasped: 60, secondsRemaining: 180, theme: .bubblegum)
    }
}
