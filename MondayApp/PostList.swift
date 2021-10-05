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
        ScrollView {
            ForEach(store.posts) { post in
                VStack(alignment: .leading, spacing: 0.0) {
                    AsyncImage(url: URL(string: post.featureImage)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxHeight: 300)
                    
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Text(post.title)
                                .font(.title3).fontWeight(.bold)
                                .padding(.trailing, 16)
                            Spacer()
                            Image(systemName: "arrow.right")
                                .padding(.top, 5)
                        }
                        Text(post.excerpt)
                            .font(.body)
                            .padding(.top, 5)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                }
                .padding(.bottom, 50)
                
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
