//
//  PostList.swift
//  MondayApp
//
//  Created by Cory Schadt on 2021-10-04.
//

import SwiftUI

struct PostList: View {
    
    @State var posts: [Post] = []
    
    var body: some View {
        
        Text("Coools")
            
            
            //        List(posts) { post in
            //            Text("Cool")
            //        }
            .onAppear {
                Api().getPosts { (posts) in
                    self.posts = posts
                    print("rad", posts)
                }
            }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
