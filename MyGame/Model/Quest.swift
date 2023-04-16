//
//  MainModel.swift
//  MyGame
//
//  Created by kxx: on 2023/03/14.
//

import SwiftUI


struct Quest: Identifiable, Hashable, Codable {
    let id: String
    let date: String
    let task: String
    let score: Int
    let isFinished: Bool
    
    init(id: String = UUID().uuidString, date: String, task: String, score: Int = 5, isFinished: Bool = false) {
        self.id = id
        self.date = date
        self.task = task
        self.score = score
        self.isFinished = isFinished
    }
}
