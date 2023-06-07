//
//  HomeView.swift
//  Commute
//
//  Created by 우주형 on 2023/06/07.
//

import SwiftUI


class HomeViewModel: ObservableObject {
    @Published var startWorkTime: Date = Date()
    @Published var timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
}

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    @State private var currentTime: Date = Date()
    var body: some View {
        VStack(spacing: 30) {
            Text(currentTime.toString())
            
            Text("출근 전")
            
            Button {
                vm.startWorkTime = Date()
            } label: {
                Text("출근")
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                    .frame(width: 200 ,height: 55)
                    .background {
                        Color.white
                            .cornerRadius(30)
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 4)
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                    }
            }
            
            
        }
        .navigationTitle("출근 기록")
        .onReceive(vm.timer) { value in
            currentTime = value
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
        }
    }
}
