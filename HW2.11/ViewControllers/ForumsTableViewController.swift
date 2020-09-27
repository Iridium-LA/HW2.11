//
//  ForumsTableViewController.swift
//  HW2.11
//
//  Created by Игорь Зигура on 26.09.2020.
//  Copyright © 2020 Zigura. All rights reserved.
//

import UIKit

class ForumsTableViewController: UITableViewController {
    
    var forumList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Cписок форумов: \(forumList)")
        print("TableView created")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(forumList.count)
        return forumList.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cell before creating")
        let cell = tableView.dequeueReusableCell(withIdentifier: "forumCell", for: indexPath)
        cell.textLabel?.text = forumList[indexPath.row]
        print("Cell created")
        return cell
    }
    
}
