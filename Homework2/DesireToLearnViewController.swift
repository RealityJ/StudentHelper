//
//  DesireToLearnViewController.swift
//  Homework2
//
//  Created by Joaquin Castro-Calvo on 2/7/16.
//  Copyright © 2016 Joaquin Castro-Calvo. All rights reserved.
//

import UIKit

class DesireToLearnViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL (string: "http://d2l.mu.edu/");
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj)
        
        forwardButton.layer.cornerRadius = forwardButton.frame.size.width/2
        forwardButton.clipsToBounds = true
        forwardButton.backgroundColor = UIColor(red: 1/255, green: 18/255, blue: 107/255, alpha: 0.8)
        forwardButton.layer.borderColor = UIColor(red: 255/255, green: 197/255, blue: 38/255, alpha: 1).CGColor
        forwardButton.layer.borderWidth = 2
        
        backButton.layer.cornerRadius = backButton.frame.size.width/2
        backButton.clipsToBounds = true
        backButton.backgroundColor = UIColor(red: 1/255, green: 18/255, blue: 107/255, alpha: 0.8)
        backButton.layer.borderColor = UIColor(red: 255/255, green: 197/255, blue: 38/255, alpha: 1).CGColor
        backButton.layer.borderWidth = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func BackClick(sender: AnyObject) {
        webView.goBack()
    }
    @IBAction func ForwardClick(sender: AnyObject) {
        webView.goForward()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
