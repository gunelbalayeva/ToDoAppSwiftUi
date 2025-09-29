//
//  LoginView.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationStack {
           HeaderView()
            Form{
               TextField("Email", text: $email)
                SecureField("Password", text: $password)
            }.frame(height: 150)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundStyle(.primary)
                    Text("Enter")
                        .foregroundStyle(.white)
                }
            })
            .frame(height: 40)
            .padding(.horizontal)
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
