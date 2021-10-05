//
//  Data.swift
//  DesignCode
//
//  Created by Meng To on 2020-01-31.
//  Copyright © 2020 Meng To. All rights reserved.
//

import SwiftUI

struct Post: Codable, Identifiable {
    var id : Int
    var title: String
    var body: String
}


//struct PostResponse: Codable, Equatable {
//    var results: [Post]
//}
//
//
//struct Post: Codable, Equatable {
//    var id: Int
//    var title: String
//}



class Api {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        //guard let url = URL(string: "https://input-logic-api.herokuapp.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            
            
            
            DispatchQueue.main.async {
                completion(posts)
                print("hello cory")
            }
        }
        .resume()
    }
}
