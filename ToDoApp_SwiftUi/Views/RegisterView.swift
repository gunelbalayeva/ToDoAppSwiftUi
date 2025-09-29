//
//  RegisterView.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import SwiftUI

struct RegisterView: View {
    //    @State var name = ""
    //    @State var surname = ""
    //    @State var password = ""
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
                        TextField("Your email", text: $viewModel.email)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                        SecureField("Your password",text: $viewModel.password)
                    }
                } .frame(height: 250)
                BigButton(title: "Register", action: {
                    viewModel.register()
                })
                Spacer()
                
                VStack{
                    Text("Already have an account?")
                    NavigationLink("Login", destination: LoginView())
                } .padding(.bottom, 20)
                
            }
        }
    }
}

#Preview {
    RegisterView()
}
