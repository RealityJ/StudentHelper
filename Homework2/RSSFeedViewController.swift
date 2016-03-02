//
//  RSSFeedViewController.swift
//  Student Helper
//
//  Created by Joaquin Castro-Calvo on 3/2/16.
//  Copyright © 2016 Joaquin Castro-Calvo. All rights reserved.
//

import UIKit

class RSSFeedViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var link: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if link != nil {
            link = link.stringByReplacingOccurrencesOfString("\"", withString: "")
            link = link.stringByReplacingOccurrencesOfString(" ", withString: "")
            let url = NSURL(string: link)
            let requestObj = NSURLRequest(URL: url!)
            webView.loadRequest(requestObj)
            
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
}
