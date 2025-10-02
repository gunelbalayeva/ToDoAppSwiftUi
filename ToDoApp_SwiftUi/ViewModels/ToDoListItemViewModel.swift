//
//  ToDoListItemViewModel.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class ToDoListItemViewModel: ObservableObject {
    init(){
        
    }
    
    func toggleIsDone(item : ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(state: !item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(item.id)
            .setData(itemCopy.asDictionary())
    }
}
