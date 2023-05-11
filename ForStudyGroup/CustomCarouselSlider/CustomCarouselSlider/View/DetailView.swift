//
//  DetailView.swift
//  CustomCarouselSlider
//
//  Created by 우주형 on 2023/05/11.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var model: CarouselViewModel
    var animation: Namespace.ID
    var body: some View {
        ZStack {
            VStack {
                Text("Monday 28 December")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.85))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.top, 10)
                    .matchedGeometryEffect(id: "Date-\(model.selectedCard.id)", in: animation)
                
                HStack {
                    Text(model.selectedCard.title)
                        .font(.title).fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 250, alignment: .leading)
                        .padding()
                        .matchedGeometryEffect(id: "Title-\(model.selectedCard.id)", in: animation)
                    Spacer(minLength: 0)
                }
                Text(model.content)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                
                model.selectedCard.cardColor
                    .cornerRadius(25)
                    .matchedGeometryEffect(id: "bgColor-\(model.selectedCard.id)", in: animation)
                    .ignoresSafeArea(.all, edges: .bottom)
            }
            
            
            VStack {
                Spacer()
                Button {
                    closeView()
                } label: {
                    Image(systemName: "arrow.down")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .clipShape(Circle())
                        .padding(5)
                        .background(Color.white.opacity(0.8))
                        .clipShape(Circle())
                        .shadow(radius: 3)
                }
                .padding(.bottom)

            }
        }
    }
    
    func closeView() {
        withAnimation(.spring()) {
            model.showCard.toggle()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
