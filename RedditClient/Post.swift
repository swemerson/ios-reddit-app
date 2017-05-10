//
//  Post.swift
//  RedditClient
//
//  Created by Sean Emerson on 4/25/17.
//  Copyright © 2017 Sean Emerson. All rights reserved.
//

import Foundation

class Post {
    var thumbnailURL: String
    var title: String
    var author: String
    var numComments: Int
    var url: String
    
    init?(jsonDict: [String: AnyObject]) {
        guard let thumbnailURL = jsonDict["thumbnail"] as? String,
            let title = jsonDict["title"] as? String,
            let author = jsonDict["author"] as? String,
            let numComments = jsonDict["num_comments"] as? Int,
            let url = jsonDict["url"] as? String else {
                return nil
        }
        
        self.thumbnailURL = thumbnailURL
        self.title = title
        self.author = author
        self.numComments = numComments
        self.url = url
    }
}
