//
//  RegisterViewModel.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore
final class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
   func register(){
        guard validate() else{
            return
        }
       
       Auth.auth().createUser(withEmail: email, password: password) {[weak self] result ,error in
           guard let userID  = result?.user.uid else {
               return
           }
           self?.insertUserRecord(id: userID)
           
       }
    }
    
    private func insertUserRecord(id :String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let database = Firestore.firestore()
        database.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Xahis olunur butun saheleri dolsurasiniz!"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Email yanlisdir"
            return false
        }
        guard password.count >= 6 else{
            errorMessage = "Sifre 6 ve ya daha cox simvoldan ibaret olmalidir!"
            return false
        }
        return true
    }
}
