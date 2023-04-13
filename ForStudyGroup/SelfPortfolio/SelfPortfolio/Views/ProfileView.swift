
import SwiftUI

struct ContentView: View {
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                Text("Steve 우주형")
                    .font(.title)
                    .overlay {
                        Circle()
                            .fill(
                                LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .frame(width: 120, height: 120)
                            .scaleEffect(animate ? 1.5 : 1)
                    }
                
                Text("빅뱅을 통해 '우주'가 만들어지던 것처럼,\n마음에 울림을 주는'예술'이 만들어지는 것처럼,\n'새로움'을 창조하는 일은 언제나 즐겁습니다.\n\n먼 훗날 제 작품들을 돌이켜 봤을 때 이런 감동을 창작했던 이로 기억 되기를...")
                    .multilineTextAlignment(.leading)
                Button {
                    withAnimation(.spring().repeatForever()) {
                        animate.toggle()
                    }
                } label: {
                    Text("톡")
                }
                
                ForEach(0..<10, id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.purple)
                        .frame(height: 40)
                        
                }
                

            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.orange)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
