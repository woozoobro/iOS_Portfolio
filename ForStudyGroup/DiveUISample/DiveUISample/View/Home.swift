//
//  Home.swift
//  DiveUISample
//
//  Created by 우주형 on 2023/05/11.
//

import SwiftUI

struct Home: View {
    var proxy: ScrollViewProxy
    var size: CGSize
    var safeArea: EdgeInsets
    // View Properties
    @State private var activePage: Int = 1
    @State private var myCards: [Card] = sampleCards
    // Page Offset
    @State private var offset: CGFloat = 0
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ProfileCard()
                
                // Indicator
                Capsule()
                    .fill(.gray.opacity(0.2))
                    .frame(width: 50, height: 5)
                    .padding(.vertical, 5)
                
                // Page Tab View Height Based on Screen Height
                let pageHeight = size.height * 0.65
                // Page Tab View
                // To Keep Track of MinY
                GeometryReader {
                    let proxy = $0.frame(in: .global)
                    
                    TabView(selection: $activePage) {
                        ForEach(myCards) { card in
                            ZStack {
                                if card.isFirstBlankCard {
                                    Rectangle()
                                        .fill(.clear)
                                } else {
                                    // Card View
                                    CardView(card: card)
                                }
                            }
                            .frame(width: proxy.width - 60)
                            // Page Tag (Index)
                            .tag(index(card))
                            .offsetX(activePage == index(card)) { rect in
                                let minX = rect.minX
                                let pageOffset = minX - (size.width * CGFloat(index(card)))
                                offset = pageOffset
                            }
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
                .frame(height: pageHeight)
            }
            .padding(.top, safeArea.top + 15)
            .padding(.bottom, safeArea.bottom + 15)
        }
    }
    
    // Profile Card View
    @ViewBuilder
    func ProfileCard() -> some View {
        HStack(spacing: 4) {
            Text("Hello")
                .font(.title)
            
            Text("Justine")
                .font(.title)
                .fontWeight(.bold)
            Spacer(minLength: 0)
            Image("orange")
                .resizable()
                .scaledToFill()
                .frame(width: 55, height: 55)
                .clipShape(Circle())
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 35)
        .background {
            RoundedRectangle(cornerRadius: 35, style: .continuous)
                .fill(Color.orange.opacity(0.2))
        }
        .padding(.horizontal, 30)
    }
    
    // Returns Index for Given Card
    func index(_ of: Card) -> Int {
        return myCards.firstIndex(of: of) ?? 0
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var card: Card
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            VStack(spacing: 0) {
                Rectangle()
                    .fill(card.cardColor.gradient)
                    // Card Details
                    .overlay(alignment: .top) {
                        VStack {
                            HStack {
                                Image("swift")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 65, height: 65)
                                Spacer(minLength: 0)
                                
                                Image(systemName: "wave.3.right")
                                    .font(.largeTitle.bold())
                            }
                            Spacer(minLength: 0)
                            Text(card.cardBalance)
                                .font(.largeTitle.bold())
                                .frame(maxWidth: .infinity, alignment:.leading)
                        }
                        .padding(30)
                    }
                Rectangle()
                    .fill(.black)
                    .frame(height: size.height / 3)
                // Card Details
                    .overlay {
                        VStack {
                            Text(card.cardName)
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Spacer(minLength: 0)
                            
                            HStack {
                                Text("Debit Card")
                                    .font(.callout)
                                Spacer(minLength: 0)
                                
                                Image("swift")
                                    .resizable()
                                    .renderingMode(.template)
                                    .scaledToFit()
                                    .frame(width: 60)
                            }
                        }
                        .foregroundColor(.white)
                        .padding(25)
                    }
            }
            .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
        }
    }
}
