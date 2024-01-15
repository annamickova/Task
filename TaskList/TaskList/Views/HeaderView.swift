//
//  HeaderView.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 03.12.2023.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let angle: Double
    let text: String
    let image: String
    let yset: Int


    
    /// header view, used in login and register view
    var body: some View {
        ZStack{
            Image(image)
                .rotationEffect(.degrees(angle))
                .offset(y: CGFloat(yset))
            VStack{
                Text(title)
                    .fontWeight(.black)
                    .foregroundColor(.black)
                    .font(.system(size: 50))
                    .bold()

                Text(text)
                    .font(.system(size: 25))
                    .bold()
                    .foregroundColor(.black)
            }
            .padding(.top, 90.0)
        }
        .frame(width: UIScreen.main.bounds.width*3, height: 300)
        .offset(y: -100)
    }
}

#Preview {
    HeaderView(title: "Title", angle: 0, text: "text", image: "backGround", yset: 120)
}
