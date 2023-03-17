//
//  TimerView.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/18.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var vm: TimerViewModel
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            Text("Hello")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Spacer()
            
            HStack {
                startButton
                stopButton
            }
            
            Spacer()
            Spacer()
        }
        .navigationTitle("타이머")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "info")
                    .padding(.all, 10)
                    .background {
                        Circle()
                            .stroke(.gray, lineWidth: 2)
                    }
                    .padding(.trailing)
            }
        }
    }
}

extension TimerView {
    private var startButton: some View {
        Button {
            
        } label: {
            Image(systemName: "play")
            Text("시작")
        }
        .font(.title)
        .fontWeight(.semibold)
        .tint(Color.white)
        .frame(height: 55)
        .padding(.horizontal)
        .background { Color.blue.cornerRadius(20)}
    }
    
    private var stopButton: some View {
        Button {
        } label: {
            Image(systemName: "stop")
            Text("종료")
        }
        .font(.title)
        .fontWeight(.semibold)
        .tint(Color.white)
        .frame(height: 55)
        .padding(.horizontal)
        .background(Color.purple.cornerRadius(20))
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimerView()
                .environmentObject(TimerViewModel())
        }
    }
}
