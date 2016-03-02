//
//  CoenViewController.swift
//  Homework2
//
//  Created by Joaquin Castro-Calvo on 2/7/16.
//  Copyright © 2016 Joaquin Castro-Calvo. All rights reserved.
//

import UIKit

class CoenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, XMLParserDelegate {

    @IBOutlet weak var engineeringDepartmentButton: UIButton!
    @IBOutlet weak var homeworkHelpButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var chosenLink: String!
    var xmlParser : XMLParser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let URL = NSURL(string: "http://feeds.feedburner.com/IeeeSpectrum");
        xmlParser = XMLParser()
        xmlParser.delegate = self
        xmlParser.startParsingWithContentsOfURL(URL!)

        tableView.backgroundColor = UIColor(red: 1/255, green: 18/255, blue: 107/255, alpha: 0.1)
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        
        engineeringDepartmentButton.layer.borderWidth = 4
        engineeringDepartmentButton.layer.borderColor = UIColor(red: 255/255, green: 197/255, blue: 38/255, alpha: 1).CGColor
        engineeringDepartmentButton.backgroundColor = UIColor(red: 1/255, green: 18/255, blue: 107/255, alpha: 0.3)
        
        homeworkHelpButton.layer.borderWidth = 4
        homeworkHelpButton.layer.borderColor = UIColor(red: 255/255, green: 197/255, blue: 38/255, alpha: 1).CGColor
        homeworkHelpButton.backgroundColor = UIColor(red: 1/255, green: 18/255, blue: 107/255, alpha: 0.3)
        
    }
    
    func parsingWasFinished() {
        self.tableView.reloadData()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return xmlParser.arrParsedData.count
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader: UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 25))
        viewHeader.backgroundColor = UIColor(red: 1/255, green: 18/255, blue: 107/255, alpha: 0.8)
        viewHeader.layer.borderWidth = 4
        viewHeader.layer.borderColor = UIColor(red: 255/255, green: 197/255, blue: 38/255, alpha: 7).CGColor
        let title: UILabel = UILabel(frame: CGRect(x: 0, y: 2, width: viewHeader.frame.width, height: 25))
        title.textAlignment = NSTextAlignment.Center
        title.text = "IEEE News Feed"
        title.textColor = UIColor(red: 255/255, green: 197/255, blue: 38/255, alpha: 1)
        title.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        viewHeader.addSubview(title)
        return viewHeader
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor(red: 255/255, green: 197/255, blue: 38/255, alpha: 1)
        let currentDictionary = xmlParser.arrParsedData[indexPath.row] as Dictionary<String, String>
        cell.textLabel?.text = currentDictionary["title"]
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath
            , animated: false)
        let currentDictionary = xmlParser.arrParsedData[indexPath.row] as Dictionary<String, String>
        chosenLink = currentDictionary["link"]!
        
        performSegueWithIdentifier("tableViewPass", sender: self)
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "tableViewPass" {
            let destinationVC = segue.destinationViewController as! RSSFeedViewController
            destinationVC.link = chosenLink
        }
    }

}
