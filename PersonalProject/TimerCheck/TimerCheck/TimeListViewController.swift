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
}
//MARK: - TimeVC Delegate
extension TimeListViewController: TimeViewControllerDelegate {
    func didSavedTime(data: TimeModel) {
        list.append(data)
        updateList()
    }
}
