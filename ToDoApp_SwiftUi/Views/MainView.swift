//
//  ContentView.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 04.09.25.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        if viewModel.isSignedIn ,!viewModel.currentUserId.isEmpty {
            ToDoListView()
        }else{
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
