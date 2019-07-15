//
//  ViewController.swift
//  Todoey
//
//  Created by Sogyal Thundup Sherpa on 16/7/19.
//  Copyright © 2019 Sogyal Thundup Sherpa. All rights reserved.
//

import UIKit

class ToDoListVC: UITableViewController {

    let itemArray = ["Book Movie","Buy Tickets","Order Food"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    
    
    //MARK - TableView DataSource methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        cell.backgroundColor = UIColor.black
        cell.textLabel?.textColor = UIColor.white
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    

}

