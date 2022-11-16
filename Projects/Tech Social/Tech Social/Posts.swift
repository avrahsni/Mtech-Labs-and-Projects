//
//  Posts.swift
//  Tech Social
//
//  Created by Snir Avrahami on 11/3/22.
//

import Foundation
import UIKit

struct Post {
    
    var image: UIImage?
    let postAccount: String
    var description: String
    
    init(image: UIImage?, postAccount: String, description: String) {
        self.image = image
        self.postAccount = postAccount
        self.description = description
    }
    
    
    static func defaultPosts() -> [Post] {
        var posts = [Post]()
        for _ in 0...10 {
            posts.append(Post(image: UIImage(named: "swift") ?? nil, postAccount: "avrahsni", description: "swift logo"))
        }
        return posts
    }
    
}




