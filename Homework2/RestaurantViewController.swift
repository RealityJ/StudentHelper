//
//  RestaurantViewController.swift
//  Homework2
//
//  Created by Joaquin Castro-Calvo on 2/10/16.
//  Copyright © 2016 Joaquin Castro-Calvo. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    var items: [String] = ["Glorioso's Italian Market", "Leon's Frozen Custard Drive-in", "Milwaukee Public Market", "Blue's Egg", "Sanford Restaurant", "Mason Street Grill", "Bartolotta's Lake Park Bistro", "Harbor House", "Mader's", "La Merenda"]
    var chosenBuilding : NSString!
    @IBOutlet weak var TableView: UITableView!
    
    
    override func viewDidLoad() {
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.image = UIImage(named: "nbackground.jpg")
        self.view.insertSubview(imageView, atIndex: 0)

        super.viewDidLoad()
        TableView.backgroundColor = UIColor.clearColor()
        TableView.delegate = self
        TableView.dataSource = self
        TableView.separatorColor = UIColor.clearColor()
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
        chosenBuilding = items[indexPath.row];
        
        performSegueWithIdentifier("RestaurantsSegue", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "RestaurantsSegue" {
            let destinationVC = segue.destinationViewController as! MapsViewController
            destinationVC.receivedBuilding = chosenBuilding;
        }
    }

}
