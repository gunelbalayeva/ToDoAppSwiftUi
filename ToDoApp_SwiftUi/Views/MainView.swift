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
            accountView
        }else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView : some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {Label("Isler", image: "house") }
            ProfileView()
                .tabItem { Label("Profile", image: "person.circle")}
        }
    }
}

#Preview {
    MainView()
}
