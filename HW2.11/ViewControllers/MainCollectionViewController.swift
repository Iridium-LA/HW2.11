//
//  MainCollectionViewController.swift
//  HW2.11
//
//  Created by Игорь Зигура on 24.09.2020.
//  Copyright © 2020 Zigura. All rights reserved.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
       
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        DataBase.forumList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellOfForumList", for: indexPath) as! CollectionViewCell
        let forumName = DataBase.forumList[indexPath.item]
        cell.nameOfForum.text = forumName
        return cell
    }    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = DataBase.forumList[indexPath.row]
        switch userAction {
        case "Активные поиски":
            NetworkManager.getDataFromJsonVarAF(from: DataBase.linksOfLA.active.rawValue) { forums in
                Model.createTableView(forums: forums)
            }
        case "Инфоподдержка":
            NetworkManager.getDataFromJsonVarAF(from: DataBase.linksOfLA.infoHelp.rawValue) { forums in
                Model.createTableView(forums: forums)
            }
        default:
            return
        }
    }
}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 20, height: 100)
    }
}
