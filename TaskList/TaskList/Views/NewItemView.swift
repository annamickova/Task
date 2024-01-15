//
//  NewItemView.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var newItem = NewItem()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Task")
                .font(.system(size: 30))
                .bold()
                .padding(.top, 50)
            
            Form {
                TextField("Title", text: $newItem.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due date", selection: $newItem.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .colorMultiply(.purple)
                   
                TLButton(title: "Save",
                         backgroundColor: .purple) {
                        if newItem.canSave{
                            newItem.save()
                            newItemPresented = false
                        }
                    else{
                        newItem.showAlert = true
                    }
                }
                .padding()
                TextField("note", text: $newItem.note)
            }
            .alert(isPresented: $newItem.showAlert) {
                Alert(title: Text("Error"), message: Text("fill in all fields and select valid due date"))
            }
        }
    }
}

#Preview{
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
