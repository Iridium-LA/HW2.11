//
//  Model.swift
//  HW2.11
//
//  Created by Игорь Зигура on 26.09.2020.
//  Copyright © 2020 Zigura. All rights reserved.
//

import UIKit

class Model {

    static var shared = Model()
    init() {}
    
    static func successAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Готово!",
                                      message: "Все получилось))",
                                      preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        return alert
    }

    static func failedAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Ошибка(",
                                      message: "Что-то пошло не так, см. консоль",
                                      preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        return alert
    }
    
    static func makeForumList(for serverAnswer: [Search]) -> [String] {
        var forumList: [String] = []
        for search in serverAnswer {
            forumList.append(search.title)
        }
        return forumList
    }
    
    static func createTableView(forums: [Search]) {
        let forumsArray = Model.makeForumList(for: forums)
        print(forumsArray)
        print("forums string array created")
        let TableVC = ForumsTableViewController()
        TableVC.forumList = forumsArray
        TableVC.tableView.reloadData()
        print("TableView reloaded")
    }
    
}
