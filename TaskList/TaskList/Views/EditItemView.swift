//
//  EditItemView.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 09.01.2024.
//

import SwiftUI

struct EditItemView: View {
    
    @StateObject var itemToEdit = NewItem()
    @Binding var editItemPresented: Bool
   
    var body: some View {
        VStack{
            Text("Edit Task")
                .font(.system(size: 30))
                .bold()
                .padding(.top, 50)
            
            Form {
                TextField("Title", text: $itemToEdit.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due date", selection: $itemToEdit.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .colorMultiply(.purple)
                    
                TLButton(title: "Save",
                         backgroundColor: .purple) {
                        if itemToEdit.canSave{
                            //itemToEdit.edit(id: , item: <#T##TaskListItem#>)
                            // if policka neprazdna ulozi
                            itemToEdit.save()
                            editItemPresented = false
                        }
                    else{
                        // ukonci, kdyz neprobehly zadne zmeny
                        editItemPresented = false
                    }
                }
                         .padding()
                TextField("note", text: $itemToEdit.note)
            }
        }
        .onAppear()
    }
}

#Preview {
    EditItemView(editItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
