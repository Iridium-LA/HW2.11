//
//  DataManager.swift
//  HW2.11
//
//  Created by Игорь Зигура on 24.09.2020.
//  Copyright © 2020 Zigura. All rights reserved.
//

struct ServerAnswer: Codable {
    let type: String
    let features: [Feature]
}

struct ServerAnswerWithForums {
    let type: String
    let features: [Any]
}

struct Search {
    let date: String
    let desc: String
    let geometry: [Any]
    let img: String
    let title: String
    let type: String
}

struct Feature: Codable {
    let title: String
    let image: String
    let date: String
    let descriptionUrl: String
    let type: String
    let geometry: Geometry
}

struct Geometry: Codable {
    let type: String
    let coordinates: String
}
