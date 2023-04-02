//
//  CarouselView.swift
//  DogGram
//
//  Created by 우주형 on 2023/02/05.
//

import SwiftUI

struct CarouselView: View {
    @State var selection: Int = 1
    let maxCount: Int = 8
    @State var timerAdded: Bool = false
    var body: some View {
        TabView(selection: $selection) {
            ForEach(1..<maxCount, id: \.self) { count in
                Image("dog\(count)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
                    .tag(count)
            }
        }
        .tabViewStyle(.page)
        .frame(height: 300)
        .animation(.default, value: selection)
        .onAppear {
            if !timerAdded {
                addTimer()
            }
        }
    }
    
    //MARK: - Functions
    func addTimer() {
        timerAdded = true
        let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            if selection == maxCount - 1 {
                selection = 1
            } else {
                selection += 1
            }
        }
        timer.fire()
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
            .previewLayout(.sizeThatFits)
    }
}
