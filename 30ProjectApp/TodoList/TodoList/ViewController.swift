//
//  ViewController.swift
//  TodoList
//
//  Created by 우주형 on 2023/01/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var editButton: UIBarButtonItem!
    var doneButton: UIBarButtonItem?
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks = [Task]() {
        didSet {
            saveTasks()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        
        tableView.delegate = self
        tableView.dataSource = self
        loadTasks()
    }
    
    @objc func doneButtonTap() {
        navigationItem.leftBarButtonItem = editButton
        tableView.setEditing(false, animated: true)
    }
    
    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
        guard !tasks.isEmpty else { return }
        navigationItem.leftBarButtonItem = doneButton
        tableView.setEditing(true, animated: true)
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default) { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            self?.tableView.reloadData()
        }
        let cancelButton = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField { textField in
            textField.placeholder = "할 일을 입력해주세요"
        }
        present(alert, animated: true, completion: nil)
    }
    
    func saveTasks() {
        let data = self.tasks.map {
            ["title" : $0.title, "done" : $0.done]
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }
    
    func loadTasks() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else { return }
        tasks = data.compactMap {
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil }
            return Task(title: title, done: done)
        }
        
        
    }
        
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        cell.accessoryType = task.done ? .checkmark : .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        if tasks.isEmpty {
            doneButtonTap()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var tasks = self.tasks
        let task = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        tasks.insert(task, at: destinationIndexPath.row)
        self.tasks = tasks
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = tasks[indexPath.row]
        task.done.toggle()
        tasks[indexPath.row] = task
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
