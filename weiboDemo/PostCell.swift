//
//  PostCell.swift
//  weiboDemo
//
//  Created by atoht on 2020/10/18.
//

import SwiftUI

struct PostCell: View {
    let post: Post
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(named: post.avatar)!)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(
                    PostVIPBadge(vip: post.vip)
                        .offset(x: 16, y: 16)
                )
            VStack(alignment: .leading, spacing: 5, content: {
                Text(post.name)
                    .font(Font.system(size: 16))
                    .foregroundColor(Color.red)
                    .lineLimit(1)
                Text(post.date)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            })
            if !post.isFollowed {
                Spacer()
                Button(action: {
                    print("click ....")
                }, label: {
                    Text("关注")
                        .font(.system(size: 14))
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .frame(width: 50, height: 26)
                        .overlay(RoundedRectangle(cornerRadius: 13)
                                    .stroke(Color.orange, lineWidth: 1)
                        )
                })
            }
        }
        
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post(avatar: "21023589.png", vip: true, name: "用户昵称!", date: "2020-10-06 00:00", isFollowed: false))
    }
}
