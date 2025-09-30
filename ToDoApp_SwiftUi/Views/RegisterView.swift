//
//  RegisterView.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import SwiftUI

struct RegisterView: View {

    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        NavigationStack {
            VStack{
                HeaderView()
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    Section(header: Text("Register")) {
                        TextField("Your name",text: $viewModel.name )
                            .autocorrectionDisabled()
                        TextField("excample@gmail.com", text: $viewModel.email)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                        SecureField("123456",text: $viewModel.password)
                            .foregroundStyle(.red)
                    }
                } .frame(height: 245)
                BigButton(title: "Register", action: {
                    viewModel.register()
                })
                Spacer()
                
                VStack{
                    Text("Already have an account?")
                    NavigationLink("Login", destination: LoginView())
                } .padding(.bottom, 16)
                
            }
        }
    }
}

#Preview {
    RegisterView()
}
