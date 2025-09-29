//
//  User.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import Foundation
struct User : Codable{
    let id :String
    let name :String
    let email :String
    let joined :TimeInterval
}
