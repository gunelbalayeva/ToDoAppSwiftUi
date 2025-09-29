//
//  MainViewModel.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import Foundation
import Firebase
class MainViewModel:ObservableObject {
    @Published var currentUserId = ""
    init(){
        Auth.auth().addStateDidChangeListener{ [weak self] _,user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn :Bool{
        return Auth.auth().currentUser != nil
    }
}
