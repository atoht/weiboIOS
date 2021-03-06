//
//  PostCellToolbarButton.swift
//  weiboDemo
//
//  Created by atoht on 2020/10/20.
//

import SwiftUI

struct PostCellToolbarButton: View {
    
    let image: String
    let text: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            HStack(spacing: 5) {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(text)
                    .font(.system(size: 15))
            }
        })
        .foregroundColor(color)
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct PostCellToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        PostCellToolbarButton(image: "heart", text: "点赞", color: .red) {
            print("点赞")
        }
    }
}
