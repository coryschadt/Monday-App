//
//  PostDetail.swift
//  MondayApp
//
//  Created by Cory Schadt on 2021-10-06.
//

import SwiftUI

struct PostDetail: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
       
            
            
            AsyncImage(url: URL(string: post.featureImage)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            
           
            
            VStack(alignment: .leading, spacing: 0.0) {
                Text(post.title)
            }
            .frame(maxWidth: .infinity)
            
            
            
            Spacer()
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

//struct PostDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        PostDetail()
//    }
//}
