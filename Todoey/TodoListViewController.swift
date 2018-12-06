//
//  TodoListViewController.swift
//  Todoey
//
//  Created by atGrass on 06/12/18.
//  Copyright © 2018 atGrass. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["Find Mike", "Buy Eggos", "Destory Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel!.text = self.itemArray[indexPath.row]
        return cell
    }
    
    // MARK: - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        print("Row \(indexPath.row): " + self.itemArray[indexPath.row])
        
        // Il seguente if-else può essere sostituito dalla singola istruzione:
//        tableView.cellForRow(at: indexPath)!.accessoryType = (tableView.cellForRow(at: indexPath)!.accessoryType == UITableViewCellAccessoryType.none) ? .checkmark : .none
        
        if tableView.cellForRow(at: indexPath)!.accessoryType == UITableViewCellAccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)!.accessoryType = UITableViewCellAccessoryType.none
        } else {
            tableView.cellForRow(at: indexPath)!.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

