//
//  ViewController.swift
//  Todoey
//
//  Created by Sogyal Thundup Sherpa on 16/7/19.
//  Copyright © 2019 Sogyal Thundup Sherpa. All rights reserved.
//

import UIKit

class ToDoListVC: UITableViewController {
    
    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.separatorStyle = .none
        
        let newItem = Item()
        newItem.title = "Buy Tickets"
        newItem.checked = false
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggs"
        newItem2.checked = false
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Buy Milk"
        newItem3.checked = false
        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item]{
            itemArray = items
        }
    }
    
    
    
    //MARK:- TableView DataSource methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.checked ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    //MARK:- TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        itemArray[indexPath.row].checked = !itemArray[indexPath.row].checked
        tableView.reloadData()
        
    }
    
    
    //MARK:- Add New Tasks
    
    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if(textField.text != nil){
                let newItem = Item()
                newItem.title = textField.text!
                self.itemArray.append(newItem)
                self.defaults.set(self.itemArray, forKey: "ToDoListArray")
                self.tableView.reloadData()
            }else{
                self.dismiss(animated: true, completion: nil )
            }
        }
        
        alert.addTextField { (alertTxtField) in
            alertTxtField.placeholder = "Add New Item"
            textField = alertTxtField
        }
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
}

