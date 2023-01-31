//
//  AlertBootcamp.swift
//  BasicSwiftUI
//
//  Created by 우주형 on 2023/01/16.
//

import SwiftUI

//struct AlertBootcamp: View {
//    @State var showAlert: Bool = false
//    @State var backgroundColor: Color = .yellow
//
//    @State var alertType: MyAlerts? = nil
//    enum MyAlerts {
//        case success
//        case error
//    }
//
//    var body: some View {
//        ZStack {
//            backgroundColor.ignoresSafeArea()
//            VStack {
//                Button("Button 1") {
//                    alertType = .error
//                    showAlert.toggle()
//                }
//                Button("Button 2") {
//                    alertType = .success
//                    showAlert.toggle()
//                }
//                .alert(isPresented: $showAlert) {
//                    getAlert()
//                }
//            }
//        }
//    }
//
//    func getAlert() -> Alert {
//        switch alertType {
//        case .error:
//            return Alert(title: Text("There was an error!"))
//        case .success:
//            return Alert(title: Text("This was an success"), message: nil, dismissButton: .default(Text("OK"), action: {
//                backgroundColor = .green
//            }))
//        default:
//            return Alert(title: Text("Error"))
//        }
//    }
//}

//struct AlertBootcamp: View {
//    @State var showAlert: Bool = false
//    @State var alertType: MyAlerts? = nil
//    @State var backgroundColor: Color = Color.yellow
//
//    enum MyAlerts {
//        case success
//        case error
//    }
//
//    var body: some View {
//        ZStack {
//            backgroundColor.edgesIgnoringSafeArea(.all)
//            VStack {
//                Button("Button1") {
//                    alertType = .error
//                    showAlert.toggle()
//                }
//                Button("Button2") {
//                    alertType = .success
//                    showAlert.toggle()
//                }
//            }
//            .alert(isPresented: $showAlert) {
//                getAlert()
//            }
//        }
//    }
//
//    func getAlert() -> Alert {
//        switch alertType {
//        case .error:
//            return Alert(title: Text("There was an error"))
//        case .success:
//            return Alert(title: Text("This was a success"), message: nil, dismissButton: .default(Text("OK"), action: {
//                backgroundColor = .green
//            }))
//        default: return Alert(title: Text("Error"))
//        }
//    }
//}

struct AlertBootcamp: View {
    @State var backgroundColor = Color.white
    @State var showAlert: Bool = false
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            HStack {
                Button("버튼 1") {
                    showAlert.toggle()
                }
            }
            .alert("알럿이 뜰겁니다", isPresented: $showAlert) {
                Button(role: .cancel) {
                    backgroundColor = .blue.opacity(0.3)
                } label: {
                    Text("취소버튼이려나?")
                }
            } message: {
                Text("웅웅")
            }

        }
    }
}

struct AlertBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AlertBootcamp()
    }
}
