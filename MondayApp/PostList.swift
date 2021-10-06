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
        NavigationView {
            ScrollView {
                HStack(spacing: 0.0) {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Spacer()
                }
                .padding(.top, 32)
                .padding(.bottom, 50)
                .padding(.horizontal, 16)
                ForEach(store.posts) { post in
                    
                    NavigationLink(destination: PostDetail(post: post)) {
                        
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
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 16)
                            .padding(.top, 20)
                        }
                        .padding(.bottom, 50)
                    }
                    .foregroundColor(Color.black)
                }
            }
            .frame(maxWidth: .infinity)
            .navigationBarHidden(true)
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
