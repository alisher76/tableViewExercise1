//
//  ViewController.swift
//  Populate UITableView
//
//  Created by Alisher Abdukarimov on 5/4/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit

var dataSource: Task = Task(title: ["Haliluya", "Muchacha", "Love And Sarcasim", "What is your Problem", "Go Fly"])

class TaskTableViewController: UIViewController, UITableViewDelegate {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    var tableView: UITableView {
        return view as! UITableView
    }
    
    override func loadView() {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = dataSource
        self.view = tableView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("we selected the cell at \(indexPath)")
        let selectedAnimal = dataSource.title[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        print("That means that they selected \(selectedAnimal)")
    }
    
    
    
    
    @IBAction func editButtonTapped(_ sender: Any) {
        OperationQueue.main.addOperation {
        
            let newButton: UIBarButtonItem
            if self.tableView.isEditing {
                newButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(TaskTableViewController.editButtonTapped(_:)))
                self.tableView.setEditing(false, animated: true)
            } else {
                newButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(TaskTableViewController.editButtonTapped(_:)))
                self.tableView.isEditing = true
            }
            self.navigationItem.rightBarButtonItem = newButton
        }
        
    }
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
    }
    
}

class Task: NSObject, UITableViewDataSource {
    
    var title: [String]
    
    init(title: [String]) {
        self.title = title
        super.init()
    }
    
    convenience override init() {
        self.init(title: [])
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return title.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            
            title.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        case .insert, .none:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let titleName = title[indexPath.row]
        cell.textLabel?.text = titleName as String
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movingObjects = title[sourceIndexPath.row]
        title.remove(at: sourceIndexPath.row)
        title.insert(movingObjects, at: destinationIndexPath.row)
        print(title)
        tableView.reloadData()
    }
    
}
