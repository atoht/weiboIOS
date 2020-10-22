//
//  ContentView.swift
//  weiboDemo
//
//  Created by atoht on 2020/10/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        NavigationLink(destination: PostListView()) {
        HomeView()
//        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView {
            ContentView()
//                .navigationTitle("跳转")
//                .navigationBarHidden(true)
//        }
        
    }
}
