//
//  TimeListViewController.swift
//  TimerCheck
//
//  Created by 우주형 on 2023/01/11.
//

import UIKit

class TimeListViewController: UIViewController {
    
    private var list = [TimeModel]() {
        didSet {
            self.saveTimeList()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    enum Section { case main }
    typealias Item = TimeModel
    
    class DataSource: UITableViewDiffableDataSource<Section, Item> {
        
        override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            guard let sourceIdentifier = itemIdentifier(for: sourceIndexPath) else { return }
            guard sourceIndexPath != destinationIndexPath else { return }
            let destinationIdentifier = itemIdentifier(for: destinationIndexPath)
            
            var snapshot = self.snapshot()

            if let destinationIdentifier = destinationIdentifier {
                if let sourceIndex = snapshot.indexOfItem(sourceIdentifier),
                   let destinationIndex = snapshot.indexOfItem(destinationIdentifier) {
                    let isAfter = destinationIndex > sourceIndex &&
                        snapshot.sectionIdentifier(containingItem: sourceIdentifier) ==
                        snapshot.sectionIdentifier(containingItem: destinationIdentifier)
                    snapshot.deleteItems([sourceIdentifier])
                    if isAfter {
                        snapshot.insertItems([sourceIdentifier], afterItem: destinationIdentifier)
                    } else {
                        snapshot.insertItems([sourceIdentifier], beforeItem: destinationIdentifier)
                    }
                }
            } else {
                let destinationSectionIdentifier = snapshot.sectionIdentifiers[destinationIndexPath.section]
                snapshot.deleteItems([sourceIdentifier])
                snapshot.appendItems([sourceIdentifier], toSection: destinationSectionIdentifier)
            }
            apply(snapshot, animatingDifferences: false)
        }
        override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                
                if let identifierToDelete = itemIdentifier(for: indexPath) {
                    var snapshot = self.snapshot()
                    snapshot.deleteItems([identifierToDelete])
                    apply(snapshot)

                }
            }
        }
    }
    
    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTimeList()
        guard let timeVC = tabBarController?.viewControllers?[0] as? TimeViewController else { return }
        timeVC.delegate = self        
        
        tableView.rowHeight = 100
        configureDataSource()
    }
    
    func configureDataSource() {
        dataSource = DataSource(tableView: tableView) { (tableView, indexPath, item) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimeTableViewCell", for: indexPath) as? TimeTableViewCell else { return nil }
            cell.configure(item)
            return cell
        }
        updateSnapshot()
    }
    
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list)
        dataSource.apply(snapshot)
    }
    
    private func saveTimeList() {
        let time = self.list.map {
            [
                "id" : $0.id,
                "seconds" : $0.seconds,
                "minutes" : $0.minutes,
                "hours" : $0.hours,
                "date" : $0.date
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(time, forKey: "timeList")
    }
    
    private func loadTimeList() {
        let userDefaults = UserDefaults.standard
        guard let data =  userDefaults.object(forKey: "timeList") as? [[String: Any]] else { return }
        self.list = data.compactMap {
            guard let id = $0["id"] as? UUID else { return nil }
            guard let seconds = $0["seconds"] as? Int else { return nil }
            guard let minutes = $0["minutes"] as? Int else { return nil }
            guard let hours = $0["hours"] as? Int else { return nil }
            guard let date = $0["date"] as? Date else { return nil }
            return TimeModel(id: id, seconds: seconds, minutes: minutes, hours: hours, date: date)
        }
    }
  
}
//MARK: - TimeVC Delegate
extension TimeListViewController: TimeViewControllerDelegate {
    func didSavedTime(data: TimeModel) {
        list.append(data)
        updateSnapshot()
    }
}

