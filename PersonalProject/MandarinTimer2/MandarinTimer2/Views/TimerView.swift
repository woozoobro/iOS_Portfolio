//
//  TimerView.swift
//  MandarinTimer2
//
//  Created by 우주형 on 2023/03/18.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var vm: TimerViewModel
    @State private var play: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                if play {
                    LottiePlayView(name: "timerProgress")
                        .transition(.move(edge: .leading))
                } else {
                    LottieStopView(name: "timerProgress")
                        .transition(.move(edge: .trailing))
                }
            }
            .frame(height: 260)

            Text(vm.studyCount.countToTimeLabel())
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom)

            HStack(spacing: 30) {
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
            vm.startButtonPressed()
            withAnimation(.spring()) {
                play.toggle()
            }
        } label: {
            Image(systemName: vm.isStarting ? "pause" : "play")
                .bold()
                .frame(width: 60)
                .minimumScaleFactor(0.5)
        }
        .font(.title)
        .fontWeight(.semibold)
        .tint(Color.white)
        .frame(height: 55)
        .padding(.horizontal)
        .background { Color.blue.cornerRadius(20)}
        .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 10)
    }
    
    private var stopButton: some View {
        Button {
            vm.stopButtonPressed()
            withAnimation(.spring()) {
                play = false
            }
        } label: {
            Image(systemName: "stop")
                .frame(width: 60)
                .bold()
        }
        .font(.title)
        .fontWeight(.semibold)
        .tint(Color.white)
        .frame(height: 55)
        .padding(.horizontal)
        .background(vm.isFinished ? Color.gray : Color.purple)
        .cornerRadius(20)
        .shadow(color: vm.isFinished ? Color.gray.opacity(0.4) : Color.purple.opacity(0.4), radius: 10, x: 0, y: 10)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimerView()
                .environmentObject(dev.timerVM)
        }
    }
}
