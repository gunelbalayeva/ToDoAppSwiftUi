//
//  ToDoApp_SwiftUiApp.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 04.09.25.
//

import SwiftUI
import FirebaseCore
// Bura bizim acilis file-mizdir, main etiketinden de belli oldugu kimi Build etdiyimiz ve programi acdigimiz zaman
//burdaki main etiketinin komeyi ile bu file oxuyur ve daha sonra MainView-a bizi yonlendirir
@main
struct ToDoApp_SwiftUiApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
