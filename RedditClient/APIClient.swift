//
//  APIClient.swift
//  RedditClient
//
//  Created by Sean Emerson on 4/25/17.
//  Copyright © 2017 Sean Emerson. All rights reserved.
//

import Foundation

class APIClient {
    static let shared = APIClient()
    
    let session = URLSession(configuration: URLSessionConfiguration.default)
    
    func getPosts(subreddit: String, completion: @escaping ([Post]?, Error?) -> Void) {
        var posts = [Post]()
        
        let url = URL(string: "https://www.reddit.com/r/\(subreddit)/.json")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            do {
                let object = try JSONSerialization.jsonObject(with: data, options: [])
                
                guard let rootDict = object as? [String: AnyObject],
                    let data = rootDict["data"] as? [String: AnyObject],
                    let children = data["children"] as? [[String: AnyObject]] else {
                        return
                }
                
                for child in children {
                    if let childData = child["data"] as? [String: AnyObject] {
                        let post = Post(jsonDict: childData)
                        if let post = post {
                            posts.append(post)
                        }
                    }
                }
                
                completion(posts, nil)
                
            } catch {
                print("Oh noes! JSON Error!")
            }
        }
        
        task.resume()
    }
}
