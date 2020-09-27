//
//  NetworkManager.swift
//  HW2.11
//
//  Created by Игорь Зигура on 24.09.2020.
//  Copyright © 2020 Zigura. All rights reserved.
//
import UIKit
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    init() {}
    
    static func fetchImage(from imageLink: String) -> UIImage? {
        guard let imageURL = URL(string: imageLink) else { return nil }
        var image: UIImage?
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let response = response {
                print(response)
            }
            
            if let data = data, let imageFromData = UIImage(data: data) {
                DispatchQueue.main.async {
                    image = imageFromData
                }
            }
        }.resume()
        return image
    }
    
/*
    static func getDataFromJsonVarOne(from url: String) -> ServerAnswer? {
        var resultData: ServerAnswer? = nil
        
        guard let url = URL(string: url) else { return resultData }
        print(url)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            do {
                resultData = try jsonDecoder.decode(ServerAnswer.self, from: data)
            
            } catch let error {
                print(error.localizedDescription)
            }
            print(data)
            
            
        }.resume()
            return resultData
    }
*/
    
    static func getDataFromJsonVarAF(from url: String, completition: @escaping ([Search]) -> Void) {
        var forumList: [Search] = []
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let coreData = value as? [String: Any] else { return }
                    let serverAnswer = ServerAnswerWithForums(
                        type: coreData["type"] as? String ?? "",
                        features: coreData["features"] as? [Any] ?? []
                    )
                    
                    let features = serverAnswer.features
                    for feature in features {
                        guard let temporaryForum = feature as? [String: Any] else { return }
                        let forum = Search(
                            date: temporaryForum["date"] as? String ?? "",
                            desc: temporaryForum["desc"] as? String ?? "",
                            geometry: temporaryForum["geometry"] as? [Any] ?? [],
                            img: temporaryForum["img"] as? String ?? "",
                            title:temporaryForum["title"] as? String ?? "",
                            type: temporaryForum["type"] as? String ?? ""
                        )
                        forumList.append(forum)
                    }
                    print("forum list created by AF: \(forumList)")
                    completition(forumList)
                    
                case .failure(let error):
                    print(error)
                }
        }
    }
    
}

//guard let statusCode = dataResponse.response?.statusCode else { return }
//print("Status code \(statusCode)")
//if (200..<300).contains(statusCode) {
//    guard let value = dataResponse.value else { return }
//    print(value)
//} else {
//    guard let error = dataResponse.error else { return }
//    print(error)
//}
