//
//  NewItemViewModel.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import Foundation
class NewItemViewModel : ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    init(){}
    
    func save(){
        
    }
}
