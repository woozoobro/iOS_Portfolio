//
//  TeameeListView.swift
//  TeameeMaker
//
//  Created by Swain Yun on 2023/03/25.
//

import SwiftUI

struct TeameeListView: View {
    @EnvironmentObject var teameeMakerViewModel: TeameeMakerViewModel
    
    var body: some View {
        ZStack {
            // if teamees.isEmpty -> NoTeameesView
            List {
                ForEach(teameeMakerViewModel.teamees) { teamee in
                    HStack {
                        Text(teamee.name)
                            .fontWeight(.bold)
                    }
                }
            }
            .listStyle(.inset)
        }
        .toolbar {
            NavigationLink {
                AdjustTeameeView()
                    .toolbar(.hidden, for: .bottomBar)
            } label: {
                Image(systemName: "plus.app")
            }

        }
    }
}

struct TeameeListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TeameeListView()
        }
        .environmentObject(TeameeMakerViewModel())
    }
}
