//
//  TeameeViewModel.swift
//  TeameeMaker
//
//  Created by Swain Yun on 2023/03/25.
//

import Foundation

class TeameeMakerViewModel: ObservableObject {
    @Published var teamees: [TeameeModel]
    @Published var tasks: [TaskModel]

    init() {
        // dummy data
        self.teamees = [
            TeameeModel(name: "dummy1"),
            TeameeModel(name: "dummy2"),
            TeameeModel(name: "dummy3"),
        ]
        
        self.tasks = [
            
        ]
    }
    
    // MARK: Methods
    // CRUD Functions
    func loadTeamees() {
        
    }
    
    func saveTeamee(teameeName: String) {
        let newTeamee = TeameeModel(name: teameeName)
        self.teamees.append(newTeamee)
    }
}
