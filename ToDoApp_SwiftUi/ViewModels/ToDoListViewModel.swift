//
//  ToDoListViewModel.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import Foundation
import FirebaseFirestore
class ToDoListViewModel:ObservableObject {
    @Published var showingNewItemView = false
    private let userId : String
    init( userId: String) {
        self.userId = userId
    }
    func delete(id :String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
