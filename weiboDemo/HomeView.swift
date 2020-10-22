//
//  HomeView.swift
//  weiboDemo
//
//  Created by atoht on 21/10/20Wednesday.
//

import SwiftUI

struct HomeView: View {
    @State var leftPercent: CGFloat = 0
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                HScrollViewController(pagdWidth: geometry.size.width, contentSize: CGSize(width: geometry.size.width * 2, height: geometry.size.height),
                                      leftPercent: self.$leftPercent) {
                    HStack(spacing: 0) {
                        PostListView(category: .recommend)
                            .frame(width: UIScreen.main.bounds.width)
                        PostListView(category: .hot)
                            .frame(width: UIScreen.main.bounds.width)
                    }
                }
            }
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 0) {
//                    PostListView(category: .recommend)
//                        .frame(width: UIScreen.main.bounds.width)
//                    PostListView(category: .hot)
//                        .frame(width: UIScreen.main.bounds.width)
//                }
//            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: $leftPercent))
            .navigationBarTitle("首页", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
