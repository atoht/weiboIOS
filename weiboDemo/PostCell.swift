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
        VStack {
            HStack {
                post.avatarImage
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
//                .padding(.leading, 10)
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
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            
            Text(post.text)
                .font(.system(size: 17))
            if !post.images.isEmpty {
                loadImage(name: post.images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 30, height: (UIScreen.main.bounds.width - 30) * 0.75)
                    .clipped()
            }
            
            Divider()
            
            HStack(spacing: 5) {
                Spacer()
                PostCellToolbarButton(image: "message", text: post.commentCountText, color: .black) {
                    print("click comment button")
                }
                Spacer()
                PostCellToolbarButton(image: "heart", text: post.likeCountText, color: .black) {
                    print("click heart button")
                }
                Spacer()
            }
            
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(Color(red: 238/256, green: 238/256, blue: 238/256))
        }
        .padding(.horizontal, 15)
        .padding(.top, 15)
        
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: postList.list[1])
            
            
    }
}
