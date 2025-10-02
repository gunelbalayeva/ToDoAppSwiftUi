//
//  BigButtonView.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 29.09.25.
//

import SwiftUI

struct BigButton: View {
    let title :String
    let action : ()-> Void
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(.primary)
                Text(title)
                    .foregroundStyle(.white)
            }
        })
        .frame(height: 40)
        .padding(.horizontal)
    }
}

#Preview {
    BigButton(title: "String", action: {})
}
