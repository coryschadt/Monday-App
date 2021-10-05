//
//  PostList.swift
//  MondayApp
//
//  Created by Cory Schadt on 2021-10-04.
//

import SwiftUI

struct PostList: View {
    @ObservedObject var store = DataStore()
    
    var body: some View {
        List(store.posts) { post in
            Text(post.title)
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
