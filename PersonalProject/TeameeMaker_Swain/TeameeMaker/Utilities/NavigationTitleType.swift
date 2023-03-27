//
//  TabViewItems.swift
//  TeameeMaker
//
//  Created by Swain Yun on 2023/03/25.
//

import Foundation

enum NavigationTitleType {
    case rootView
    case teameeListView
    case taskListView
    case calendarView
    case adjustTeameeView
    
    var navigationTitle: String {
        switch self {
        case .rootView: return "Teamee Maker"
        case .teameeListView: return "All Teamees"
        case .taskListView: return "Tasks"
        case .calendarView: return "Calendar"
        case .adjustTeameeView: return "Adjust Teamee"
        }
    }
}
