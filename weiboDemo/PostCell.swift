//
//  PostCell.swift
//  weiboDemo
//
//  Created by atoht on 2020/10/18.
//

import SwiftUI

struct PostCell: View {
    let post: Post
    
    var bindingPost: Post {
        userData.post(forId: post.id)!
    }
    
    @State var presentComment: Bool = false
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        var post = bindingPost
        return VStack(alignment: .leading) {
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
                                .padding(.leading, 10)
                if !post.isFollowed {
                    Spacer()
                    Button(action: {
                        post.isFollowed = true
                        self.userData.update(post)
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
                .frame(alignment: .topLeading)
            if !post.images.isEmpty {
                PostImageCell(images: post.images, width: UIScreen.main.bounds.width - 30)
            }
            
            Divider()
            
            HStack(spacing: 0) {
                Spacer()
                PostCellToolbarButton(image: "message", text: post.commentCountText, color: .black) {
                    self.presentComment = true
                }
                .sheet(isPresented: $presentComment, content: {
                    CommentInputView(post: post).environmentObject(self.userData)
                })
                
                Spacer()
                PostCellToolbarButton(image: post.isLiked ? "heart.fill" : "heart", text: post.likeCountText, color: post.isLiked ? .red : .black) {
                    if post.isLiked {
                        post.isLiked = false
                        post.likeCount -= 1
                    } else {
                        post.isLiked = true
                        post.likeCount += 1
                    }
                    self.userData.update(post)
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
        let userData = UserData()
        return PostCell(post: userData.recommendPostList.list[0]).environmentObject(userData)
        
        
    }
}
