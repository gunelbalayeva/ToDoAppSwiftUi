//
//  HeaderView.swift
//  ToDoApp_SwiftUi
//
//  Created by User on 28.09.25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            Image("apple")
                .resizable()
                .frame(width: 120, height: 120)
            Text("Alpha")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(.top, 30)
        }.padding(.top, 100)
    }
}

#Preview {
    HeaderView()
}
