//
//  PostListView.swift
//  weiboDemo
//
//  Created by atoht on 2020/10/20.
//

import SwiftUI

struct PostListView: View {
    
    let category: PostListCategory
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            ForEach(userData.postList(for: category).list) { post in
                ZStack {
                    PostCell(post: post)
                    NavigationLink(destination: PostDetailView(post: post)) {
//                        PostCell(post: post)
                        EmptyView()
                    }
                    .fixedSize()
//                    .hidden()
                }
                .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView(category: .recommend)
                .environmentObject(UserData())
                .navigationBarTitle("title")
                .navigationBarHidden(true)
        }
    }
}
