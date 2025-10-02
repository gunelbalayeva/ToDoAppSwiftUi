//
//  ProfileView.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import SwiftUI
struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                    
                    BigButton(title: "Log out", action: {
                        viewModel.logOut()
                    })
                } else {
                    ProgressView("Loading...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .frame(width: 125, height: 125)
            
            HStack {
                Text("Name:")
                Text(user.name)
            }
            
            HStack {
                Text("Email:")
                Text(user.email)
            }
            
            HStack {
                Text("Date:")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
    }
}

#Preview {
    ProfileView()
}
