//
//  TimeListViewController.swift
//  TimerCheck
//
//  Created by 우주형 on 2023/01/11.
//

import UIKit
import CoreData

class TimeListViewController: UIViewController {
    
    var list = [TimeModel]()
    var timeItem = [TimeItem]()
    
    @IBOutlet weak var tableView: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
        loadItems()
        guard let timeVC = tabBarController?.viewControllers?[0] as? TimeViewController else { return }
        timeVC.delegate = self
        tableView.delegate = self
        
        tableView.rowHeight = 100
        configureDataSource()
    }
    
    func configureDataSource() {
        dataSource = DataSource(tableView: tableView) { (tableView, indexPath, item) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimeTableViewCell", for: indexPath) as? TimeTableViewCell else { return nil }
            cell.configure(item)
            return cell
        }
        updateList()
    }
    
    private func updateList() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list)
        dataSource.apply(snapshot)
    }
    
    private func loadItems() {
        let request: NSFetchRequest<TimeItem> = TimeItem.fetchRequest()
        do {
            timeItem = try context.fetch(request)
            list = timeItem.map { TimeModel(seconds: Int($0.seconds ?? "0") ?? 0, minutes: Int($0.minutes ?? "0") ?? 0, hours: Int($0.hours ?? "0") ?? 0, date: $0.date ?? Date()) }
        } catch {
            print("Error fetching data from context \(error)")
        }
    }
    
    func deleteItems(indexPath: IndexPath) {
//        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "TimeItem")
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
//        do {
//            try context.execute(deleteRequest)
//        } catch {
//            print(error.localizedDescription)
//        }
//
        let timeItemToDelete = self.timeItem[indexPath.row]
        self.context.delete(timeItemToDelete)
        do {
            try self.context.save()
        } catch {
            print("Error deleting item from context \(error)")
        }
    }
}
//MARK: - TimeVC Delegate
extension TimeListViewController: TimeViewControllerDelegate {
    func didSavedTime(data: TimeModel) {
        list.append(data)
//        loadItems()
        updateList()
    }
}

extension TimeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        deleteItems(indexPath: indexPath)
    }
}
