//
//  BuildingsViewController.swift
//  Homework2
//
//  Created by Joaquin Castro-Calvo on 2/6/16.
//  Copyright © 2016 Joaquin Castro-Calvo. All rights reserved.
//

import UIKit

class BuildingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var navigationbar: UINavigationBar!
    @IBOutlet weak var TableView: UITableView!
    var items: [String] = ["Library", "Engineering Hall", "Olin Engineering", "Cudahy"]
    var chosenBuilding : NSString!
    
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
    }
    
    
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
            chosenBuilding = items[indexPath.row];
        
            performSegueWithIdentifier("MapsSegue", sender: self)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "MapsSegue" {
            let destinationVC = segue.destinationViewController as! MapsViewController
            destinationVC.receivedBuilding = chosenBuilding;
        }
    }

}
