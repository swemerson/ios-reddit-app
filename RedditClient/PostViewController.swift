//
//  PostViewController.swift
//  RedditClient
//
//  Created by Sean Emerson on 5/6/17.
//  Copyright © 2017 Sean Emerson. All rights reserved.
//

import UIKit
import WebKit

class PostViewController: UIViewController, WKNavigationDelegate {
    var urlString: String = ""

    @IBOutlet weak var webView: UIWebView!
    //@IBOutlet weak var webView: webview!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        guard let url = URL(string: urlString) else {
//            return
//        }
//        
//        let urlRequest = URLRequest(url: url)
//        
//        webView = WKWebView(frame: self.view.frame)
//        webView.navigationDelegate = self
//        webView.load(urlRequest)
//        self.view.addSubview(webView)
//        self.view.sendSubview(toBack: webView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        webView.loadRequest(urlRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
