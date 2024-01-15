//
//  TLButton.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let backgroundColor: Color
    let action:  () -> Void
    
    
    var body: some View {
        /// universal task list button
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Title", backgroundColor: .blue) {
        // action
    }
}
