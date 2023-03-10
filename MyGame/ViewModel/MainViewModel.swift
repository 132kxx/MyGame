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

    func getGroupedQuest() -> [String : [Quest]]{
        return Dictionary(grouping: self.quest) { $0.date }
    }
    
    func getKeys() -> Array<String> {
        return Array(getGroupedQuest().keys).sorted().reversed()
    }
    
    var dommy = [
        Quest(date: "2월 18일", name: "일하기", score: 5),
        Quest(date: "2월 18일", name: "일어나기", score: 5),
        Quest(date: "2월 20일", name: "깨기", score: 5),
        Quest(date: "2월 10일", name: "식사", score: 5),
        Quest(date: "2월 15일", name: "운동", score: 5),
        Quest(date: "2월 28일", name: "카페가기", score: 5)

    ]
    
    var dataArray: [String] = [
        "complete task",
        "drink water",
        "세무사공부하기?",
        "개발자되기"
    ]
}


