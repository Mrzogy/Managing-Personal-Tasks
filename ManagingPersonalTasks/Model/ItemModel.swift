//
//  ItemModel.swift
//  ManagingPersonalTasks
//
//  Created by 3bood on 12/11/1444 AH.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    func UpdateCompletion() -> ItemModel {
        return ItemModel(id:id,title: title, isCompleted: !isCompleted)
    }
}


