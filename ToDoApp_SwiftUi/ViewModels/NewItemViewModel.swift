//
//  NewItemViewModel.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class NewItemViewModel : ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init(){}
    
    func save() {
        guard canSave else {
            return
        }
        
        // 2. İstifadəçi login olmayıbsa, heç nə eləmə
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // 3. Yeni item üçün unikal id yarad
        let newItemID = UUID().uuidString
        
        // 4. Model obyektini yarat
        let newItem = ToDoListItem(
            id: newItemID,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        // 5. Firestore-da path: users/{uid}/todos/{newItemID}
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newItemID)
            .setData(newItem.asDictionary()) { error in
                if let error = error {
                    print(" Sənəd saxlanmadı: \(error.localizedDescription)")
                    self.showAlert = true
                } else {
                    print(" Yeni item uğurla saxlanıldı")
                }
            }
    }

    
    var canSave : Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
