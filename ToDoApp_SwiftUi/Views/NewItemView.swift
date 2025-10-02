//
//  NewItemView.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import SwiftUI

struct NewItemView: View {
    @Binding var newItemPresented:Bool
    @StateObject var viewModel = NewItemViewModel()
    var body: some View {
        VStack {
            Text("Yeni is") .font(.title).bold() .padding(.top , 40)
            Form{
                TextField ("Basliq" , text: $viewModel.title)
                DatePicker("Bitme tarixi", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                BigButton(title: "Save", action: {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented  = false
                    } else {
                        viewModel.showAlert = true
                    }
                })
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title:Text( "Xeta"),message: Text("Duzgun melumat daxil edin"))
            })
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
