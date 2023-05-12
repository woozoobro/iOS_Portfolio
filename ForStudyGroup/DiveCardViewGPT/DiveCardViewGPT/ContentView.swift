//
//  ContentView.swift
//  DiveCardViewGPT
//
//  Created by 우주형 on 2023/05/12.
//

import SwiftUI

struct ContentView: View {
    @State private var cardOffset: CGSize = .zero
    @State private var isDragging: Bool = false
    @State private var cardWidth: CGFloat = 340
    @State private var cardHeight: CGFloat = 420
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            CardView()
                .frame(width: cardWidth, height: cardHeight)
                .overlay {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30).stroke(.linearGradient(colors: [.white.opacity(0.6), .clear, .white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        RoundedRectangle(cornerRadius: 30).stroke(.linearGradient(colors: [.white.opacity(0.4), .clear, .white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 20)
                            .blur(radius: 30)
                    }
                }
                .offset(y: cardOffset.height)
                .rotation3DEffect(Angle(degrees: cardOffset != .zero ? 10 : 0),
                                  axis: (x: -cardOffset.height, y: cardOffset.width, z: 0))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                cardOffset = value.translation
                                isDragging = true
                            }
                        }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                cardOffset = .zero
                                isDragging = false
                            }
                        }
                )
                        
        }
    }
}

struct CardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("프로젝트")
                .font(.title)
            
            Text("23.06.01 ~ 23.06.30")
                .font(.body)
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text("SwiftUI Combine")
                    Text("앱만들기")
                }
                Spacer()
                Image(systemName: "applelogo")
                    .font(.largeTitle)
            }
        }
        .padding(30)
        .background(gradientBackground)
        .cornerRadius(30)
        .overlay {
            RoundedRectangle(cornerRadius: 30)
                .strokeBorder(gradientOutline,lineWidth: 2)
        }
        .shadow(color: .orange.opacity(0.4), radius: 120, x: 0, y: 0)
    }
    
    var gradientBackground: some View {
        LinearGradient(gradient: Gradient(colors: [Color(hex: "#FFD89E"), Color(hex: "#EFFFCE")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }

    var gradientOutline: LinearGradient {
        LinearGradient(gradient: Gradient(stops: [
            Gradient.Stop(color: Color.white.opacity(1), location: 0),
            Gradient.Stop(color: Color.clear, location: 0.5),
            Gradient.Stop(color: Color.white.opacity(1), location: 1)
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: Double(a) / 255)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//MARK: - EmitterSwiftUIView

/*
 //Inside ZStack of ContentView
 ParticleEmitterView(isDragging: $isDragging)
     .frame(width: cardWidth, height: cardHeight)
     .offset(cardOffset)
     .offset(y: cardOffset.height)
     .rotation3DEffect(
         Angle(degrees: cardOffset != .zero ? 30 : 0),
         axis: (x: -cardOffset.height, y: cardOffset.width, z: 0.0)
     )
     .allowsHitTesting(false) // Add this line
     .blendMode(.screen)
 
struct ParticleEmitterView: UIViewRepresentable {
    @Binding var isDragging: Bool

    // Add this array of colors for the particles
    let particleColors: [UIColor] = [
        .systemYellow, .systemOrange, .systemPink, .systemGreen
    ]

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let emitterLayer = createEmitterLayer()
        view.layer.addSublayer(emitterLayer)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        guard let emitterLayer = uiView.layer.sublayers?.compactMap({ $0 as? CAEmitterLayer }).first else { return }

        emitterLayer.emitterCells?.forEach { cell in
            cell.birthRate = isDragging ? 3 : 2
            cell.velocity = isDragging ? 140 : 10
            cell.lifetime = isDragging ? 1.2 : 1
            cell.scale = isDragging ? 0.1 : 0.04
            cell.spinRange = isDragging ? 1 : 0.05
        }
    }

    private func createEmitterLayer() -> CAEmitterLayer {
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterShape = .rectangle
        emitterLayer.emitterSize = CGSize(width: 340, height: 420)
        emitterLayer.emitterPosition = CGPoint(x: 170, y: 210)
        emitterLayer.renderMode = .oldestFirst
        emitterLayer.emitterCells = createEmitterCells()
        return emitterLayer
    }

    private func createEmitterCells() -> [CAEmitterCell] {
        let numberOfEmitters = 40
        return (0..<numberOfEmitters).map { index in
            let emitterCell = createEmitterCell()
            let emissionLongitude = Double(index) * (1 * Double.pi) / Double(numberOfEmitters)
            emitterCell.emissionLongitude = CGFloat(emissionLongitude)
            emitterCell.birthRate = 5
            emitterCell.velocity = 40
            emitterCell.lifetime = 1.5

            // Randomly select a color from the particleColors array
            let randomColor = particleColors.randomElement() ?? .white
            emitterCell.color = randomColor.cgColor // Set the emitterCell's color

            return emitterCell
        }
    }

    private func createEmitterCell() -> CAEmitterCell {
        let emitterCell = CAEmitterCell()

        // Custom white circle image
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 20, height: 20))
        let whiteCircle = renderer.image { context in
            UIColor.white.setFill()
            context.cgContext.fillEllipse(in: CGRect(x: 0, y: 0, width: 20, height: 20))
        }
        emitterCell.contents = whiteCircle.cgImage

        emitterCell.birthRate = 1
        emitterCell.lifetime = 1.0
        emitterCell.scale = 0.5
        emitterCell.scaleRange = 0.02
        emitterCell.scaleSpeed = -0.1
        emitterCell.velocity = 40
        emitterCell.velocityRange = 10
        emitterCell.yAcceleration = 0
        emitterCell.zAcceleration = 1
        emitterCell.alphaRange = 0.7
        emitterCell.alphaSpeed = -0.7
        return emitterCell
    }
}
*/
