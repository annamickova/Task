//
//  ItemView.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import SwiftUI

struct ItemView: View {
    
    @StateObject var tlItem = Item()
    let item: TaskListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading ){
                Text(item.title)
                    .bold()
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                    .bold()
                Text(item.note)
                    .bold()
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button{
                tlItem.toggleIsDone(item: item)
            }label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.purple)
            }
        }
    }
}

#Preview {
    ItemView(item: .init(id: "211", title: "get some milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, note: "note", isDone: true))
}
