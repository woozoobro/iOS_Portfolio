//
//  EnvironmentObjectBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/19.
//

import SwiftUI

//ObservedObject
//StateObject
//EnvironmentObject

class EnvironmentViewModel: ObservableObject {    
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["iPhone", "iPad", "iMac", "Apple Watch"])
    }
}

struct EnvironmentObjectBootcamp: View {
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink {
                        DetailView(selectedItem: item)
                    } label: {
                        Text(item)
                    }
                }
            }
            .navigationTitle("iOS Devices")
        }
        .environmentObject(viewModel)
    }
}

struct DetailView: View {
    let selectedItem: String
    
    var body: some View {
        ZStack {
            // background
            Color.orange.ignoresSafeArea()
            
            // foreground
            NavigationLink {
                FinalView()
            } label: {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(.white)
                    .cornerRadius(30)
            }
        }
    }
}

struct FinalView: View {
    
    @EnvironmentObject var viewModel: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            // background
            LinearGradient(colors: [.blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            // foreground
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.dataArray, id: \.self) { item in
                        Text(item)
                    }
                }
                .foregroundColor(.white)
                .font(.largeTitle)
            }
        }
    }
}

struct EnvironmentObjectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EnvironmentObjectBootcamp()
//            DetailView(selectedItem: "iPhone")
//            FinalView()
        }
    }
}
