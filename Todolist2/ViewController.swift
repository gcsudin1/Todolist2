//
//  ViewController.swift
//  Todolist2
//
//  Created by IMCS2 on 7/27/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit
var todoListItems = [String]()

class ViewController: UITableViewController {
    override func viewDidAppear(_ animated: Bool) {
        if let storedArray = UserDefaults.standard.value(forKey: "item"){
        todoListItems = storedArray as? [String] ?? []
    }else{
        
     UserDefaults.standard.set(todoListItems, forKey: "item")
        }
    
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListItems.count
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            todoListItems.remove(at: indexPath.row)
            self.tableView.deleteRows(at:[indexPath],with:.automatic)
            UserDefaults.standard.set(todoListItems, forKey: "item")
        }
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.textLabel?.textColor = UIColor.blue
        tableView.reloadData()
        return nil
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let todo: String = todoListItems[indexPath.row]
        cell.textLabel?.text = todo
        return cell
    }

}

