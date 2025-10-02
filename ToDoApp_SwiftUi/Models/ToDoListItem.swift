//
//  ToDoListItem.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import Foundation
struct ToDoListItem :Codable, Identifiable {
    let id :String
    let title :String
    let dueDate :TimeInterval
    let createdDate :TimeInterval
    var isDone :Bool
    
    mutating func setDone(state :Bool){
        isDone = state
    }
}
