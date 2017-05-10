//
//  MenuViewController.swift
//  RedditClient
//
//  Created by Sean Emerson on 5/5/17.
//  Copyright © 2017 Sean Emerson. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var subReddit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let postsTableViewController = segue.destination as? PostsTableViewController
            else {
                return
        }
        
        postsTableViewController.subreddit = subReddit.text!
    }
}
