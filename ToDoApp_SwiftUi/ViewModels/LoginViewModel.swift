//
//  LoginViewModel.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import Foundation
class LoginViewModel :ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login(){
        guard validate() else{
            return
        }
       
    }
    
    func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
        !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Xahis olunur butun saheleri dolsurasiniz!"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Email yanlisdir"
            return false
        }
        return true
    }
}
