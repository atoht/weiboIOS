//
//  PostListView.swift
//  weiboDemo
//
//  Created by atoht on 2020/10/20.
//

import SwiftUI

struct PostListView: View {
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    var body: some View {
        List {
            ForEach(postList.list) { post in
                PostCell(post: post)
                    .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
