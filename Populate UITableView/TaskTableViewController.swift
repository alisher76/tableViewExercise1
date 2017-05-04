//
//  ViewController.swift
//  Populate UITableView
//
//  Created by Alisher Abdukarimov on 5/4/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit

class TaskTableViewController: UIViewController, UITableViewDelegate {

    var dataSource: Task = Task(title: ["Haliluya", "Muchacha", "Love And Sarcasim", "What is your Problem", "Go Fly"])
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }

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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        
        }
    }

    
}

class Task: NSObject, UITableViewDataSource {
    
    let title: [NSString]
    
    init(title: [NSString]) {
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
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let titleName = title[indexPath.row]
        cell.textLabel?.text = titleName as String
        return cell
    }
    
    
    
}
