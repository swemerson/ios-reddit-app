//
//  ViewController.swift
//  RedditClient
//
//  Created by Sean Emerson on 4/25/17.
//  Copyright © 2017 Sean Emerson. All rights reserved.
//

import Foundation
import UIKit

class PostsTableViewController: UITableViewController {
    var posts = [Post]()
    var subreddit: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = subreddit
      
        APIClient.shared.getPosts(subreddit: subreddit) { (posts: [Post]?, error: Error?) in
            DispatchQueue.main.async {[weak self] in
                guard let posts = posts else {
                    return
                }
                
                self?.posts = posts
                
                self?.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table View Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "PostTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PostsTableViewCell else {
            fatalError("Oops, the dequeued cell is not an instance of PostTableViewCell.")
        }
        
        let post = posts[indexPath.row]
        
        cell.titleLabel.text = post.title
        cell.authorLabel.text = post.author
        cell.commentsLabel.text = String(post.numComments)
        
        // If thumbnailURL is not "self" then grab the image stored in url
        if (post.thumbnailURL != "self") {
            guard let url = URL(string: post.thumbnailURL),
            let data = NSData(contentsOf: url as URL) else {
                return cell
            }
    
            cell.thumbnail.image = UIImage(data: data as Data)
        } else {
            cell.thumbnail.image = UIImage()
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let postViewController = segue.destination as? PostViewController,
            let postsTableViewCell = sender as? PostsTableViewCell,
            let indexPath = tableView.indexPath(for: postsTableViewCell) else {
            return
        }
        
        postViewController.urlString = posts[indexPath.row].url
    }
}

