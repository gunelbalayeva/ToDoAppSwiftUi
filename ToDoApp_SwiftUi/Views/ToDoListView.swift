//
//  ToDoListView.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel = ToDoListViewModel()
    private let userId :String
    init(userId :String){
        self.userId = userId
    }
    var body: some View {
        NavigationView {
            VStack{
                
            }  .navigationTitle("Gorulecek isler")
                .toolbar {
                    Button {
                        viewModel.showingNewItemView = true
                    }
                label:{
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $viewModel.showingNewItemView, content: {
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                })
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
