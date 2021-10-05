//
//  Data.swift
//  DesignCode
//
//  Created by Meng To on 2020-01-31.
//  Copyright © 2020 Meng To. All rights reserved.
//

import SwiftUI

struct PostResponse: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [Post]
}

struct Post: Codable, Identifiable {
    var id: Int
    var title: String
    var featureImage: String
    var excerpt: String
}

class Api {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://input-logic-api.herokuapp.com/posts?format=json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Error with fetching posts: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      print("Error with the response, unexpected status code: \(String(describing: response))")
                      return
                  }
            
            let posts = try! JSONDecoder().decode(PostResponse.self, from: data!).results
            
            DispatchQueue.main.async {
                completion(posts)
            }
            
        }
        .resume()
    }
}
