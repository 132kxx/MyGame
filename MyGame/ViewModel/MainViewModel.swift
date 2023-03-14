//
//  MainViewModel.swift
//  MyGame
//
//  Created by kxx: on 2023/03/14.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var quest: [Quest] = []
    
    init() {
        getData()
    }
    
    
    func getData() {
        quest.append(contentsOf: dommy)
    }
    
    var dommy = [
        Quest(date: "2월 18일", name: "일하기", score: 5),
        Quest(date: "2월 18일", name: "일어나기", score: 5),
        Quest(date: "2월 20일", name: "깨기", score: 5),
        Quest(date: "2월 10일", name: "깨기", score: 5)
    ]
}
