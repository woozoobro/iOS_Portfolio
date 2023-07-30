//
//  ErrorView.swift
//  ConcurrencyJourney
//
//  Created by 우주형 on 2023/07/26.
//

import SwiftUI

enum DisplayError: Error {
    case notDriveTime
    case noBusDriver
}

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    let guidance: String
}

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 30) {
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.largeTitle)
            }
            
            Text("버스 디스플레이 오류")
                .font(.title)
                .padding(.bottom)
            
            Text(errorWrapper.error.localizedDescription)
                .font(.headline)
            Text(errorWrapper.guidance)
                .font(.body)
                .padding(.top)
            Spacer()
        }
        .padding(.top)
        .background(.ultraThinMaterial)
        .cornerRadius(16)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: DisplayError.notDriveTime, guidance: "버스가 출발할 수 없는 시간입니다")
    }
    
    static var previews: some View {
        ErrorView(errorWrapper: wrapper)
    }
}
