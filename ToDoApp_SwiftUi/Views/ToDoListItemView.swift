//
//  ToDoListItemView.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    let item :ToDoListItem
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(item.title) .font(.headline)
                Text ("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color.secondary)
            }
            Spacer()
            Button {
                viewModel.toggleIsDone(item: item)
            }
            label : {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(Color.green)
            }
        }
    }
}

#Preview {
    ToDoListItemView(item:
            .init(id: "123",
             title: "Test",
             dueDate: Date().timeIntervalSince1970,
             createdDate:  Date().timeIntervalSince1970,
             isDone: false))
}
