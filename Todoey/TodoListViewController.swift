//
//  TodoListViewController.swift
//  Todoey
//
//  Created by atGrass on 06/12/18.
//  Copyright © 2018 atGrass. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Eggos", "Destory Demogorgon"]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let items = self.defaults.array(forKey: "todoListArray") as? [String] {
            self.itemArray = items
        }
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
    
    // MARK: - IBAction Methods
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Add Item", style: UIAlertActionStyle.default) { (action) in
            // What will happen once the user clicks the button on our alert
            self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "todoListArray")
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

