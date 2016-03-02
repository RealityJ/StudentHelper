//
//  HomeworkHelpViewController.swift
//  Homework2
//
//  Created by Joaquin Castro-Calvo on 2/7/16.
//  Copyright © 2016 Joaquin Castro-Calvo. All rights reserved.
//

import UIKit

class HomeworkHelpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var TableView: UITableView!
    var items: [String] = ["Stack Overflow", "Khan Academy", "Google", "Wolfram Alpha"]
    var chosenLink : NSString!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        TableView.backgroundColor = UIColor.clearColor()
        TableView.delegate = self
        TableView.dataSource = self
        TableView.separatorColor = UIColor.clearColor()
        TableView.tableFooterView = UIView(frame: CGRectZero)
        self.TableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = TableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.textColor = UIColor(red: 255/255, green: 197/255, blue: 38/255, alpha: 1)
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        TableView.deselectRowAtIndexPath(indexPath
            , animated: false)
        chosenLink = items[indexPath.row];
        
        performSegueWithIdentifier("HelpToWebSegue", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "HelpToWebSegue" {
            let destinationVC = segue.destinationViewController as! HelpWebViewController
            destinationVC.receivedWebsite = chosenLink;
        }
    }
}
