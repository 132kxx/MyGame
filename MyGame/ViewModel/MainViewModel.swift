//
//  MainViewModel.swift
//  MyGame
//
//  Created by kxx: on 2023/03/14.
//

import SwiftUI

class MainViewModel: ObservableObject {
    let codekey = "items_list"
    
    @Published var quest: [Quest] = [] {
        didSet {
            saveItem()
        }
    }
    
    init() {
        getData()
    }
    
    func getData() {
       guard
            let item = UserDefaults.standard.data(forKey: codekey),
            let decodedItem = try? JSONDecoder().decode([Quest].self, from: item)
        else { return }

        self.quest = decodedItem
    }
    
    func addDataArray(quest: String) {
        let newElement = Quest(date: "4월 16일", task: quest, score: 5)
        self.quest.append(newElement)
    }
    
    func plusScore() -> Int {
        var sumScore = 0
        for i in quest {
            if i.isFinished {
                sumScore += i.score
            }
        }
        return sumScore
    }
    
    func editFinish(element: Quest) {
        if let index = self.quest.firstIndex(where: { $0.id == element.id }) {
            quest[index] = Quest(id: element.id, date: element.date, task: element.task, score: element.score, isFinished: !element.isFinished)
        } else {
            return
        }
    }
    
    func getDate() -> Array<String> {
        var dates: [String] = []
        if quest.count > 0 {
            let finished = quest.filter{ $0.isFinished == true }
            dates = Array(Set(finished.map { $0.date }))
            dates.sort(by: >)
        }
        return dates
    }
    
    func saveItem() {
        if let encodedItem = try? JSONEncoder().encode(quest) {
            UserDefaults.standard.set(encodedItem, forKey: codekey)
        }
    }
}


