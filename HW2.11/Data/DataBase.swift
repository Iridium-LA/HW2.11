//
//  DataBase.swift
//  HW2.11
//
//  Created by Игорь Зигура on 24.09.2020.
//  Copyright © 2020 Zigura. All rights reserved.
//


class DataBase {
    
    static var shared = DataBase()
    init() {}
    
    enum forums: String, CaseIterable {
        case active = "Активные поиски"
        case infoHelp = "Информационная поддержка"
        case regions = "Региональные поиски (n/a now)"
    }
    
    static var forumList = ["Активные поиски", "Инфоподдержка"]
        
    enum linksOfLA: String, CaseIterable {
        case active = "https://muz1kand.online/forum2map/rss2json.php?id=276"
        case infoHelp = "https://muz1kand.online/forum2map/rss2json.php?id=41"
    }
}


