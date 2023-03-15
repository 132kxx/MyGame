//
//  MainModel.swift
//  MyGame
//
//  Created by kxx: on 2023/03/14.
//

import SwiftUI


struct Quest: Identifiable, Hashable {
    let id = UUID().uuidString
    let date: String
    let name: String
    let score: Int
}
