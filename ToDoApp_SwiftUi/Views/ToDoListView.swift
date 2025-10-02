//
//  ToDoListView.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import SwiftUI
import FirebaseFirestoreSwift
struct ToDoListView: View {
    
    @StateObject var viewModel : ToDoListViewModel
    @FirestoreQuery var items :[ToDoListItem]
    
    
    init(userId :String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    var body: some View {
        NavigationView {
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .background(Color.red)
                        }
                } .listStyle(PlainListStyle())
                
            }  .navigationTitle("Coşqunun taskları")
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
    ToDoListView(userId: "DwWuAPKyCXYEvCQlPqLEM9RuIVJ2")
}
