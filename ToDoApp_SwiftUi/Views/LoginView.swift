//
//  LoginView.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import SwiftUI

struct LoginView: View {
//    @State var email = ""
//    @State var password = ""
    
   @StateObject var viewModel = LoginViewModel()
    
    
    var body: some View {
        NavigationStack {
           HeaderView()
            Form{
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                Section(header: Text("Login")) {
                    TextField("Email", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                }
            }.frame(height: 170)
            BigButton(title: "Login", action: {
                viewModel.login()
            })
           
            Spacer()
            
            VStack{
                Text("Don't have an account?")
                NavigationLink("Create an account", destination: RegisterView())
            } .padding(.bottom, 20)
        }
    }
}

#Preview {
    LoginView()
}
