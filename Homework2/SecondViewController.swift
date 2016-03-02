//
//  SecondViewController.swift
//  Homework2
//
//  Created by Joaquin Castro-Calvo on 2/6/16.
//  Copyright © 2016 Joaquin Castro-Calvo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var restaurantsView: UIView!
    @IBOutlet weak var nightlifeView: UIView!
    @IBOutlet weak var downtownView: UIView!
    @IBOutlet weak var campusView: UIView!
    
    override func viewDidLoad() {
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.image = UIImage(named: "nbackground.jpg")
        
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.tabBarController?.tabBar.hidden = false;
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 197/255, blue: 38/255, alpha: 1)
        imageView.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        self.view.insertSubview(imageView, atIndex: 0)
        
        restaurantsView.layer.borderWidth = 5;
        restaurantsView.layer.borderColor =  UIColor(red: 255/255, green: 197/255, blue: 38/255, alpha: 1).CGColor
        restaurantsView.layer.cornerRadius = 5;
        restaurantsView.backgroundColor = UIColor(red: 1/255, green: 18/255, blue: 107/255, alpha: 0.3)

        
        nightlifeView.layer.borderWidth = 5;
        nightlifeView.layer.borderColor =  UIColor(red: 255/255, green: 197/255, blue: 38/255, alpha: 1).CGColor
        nightlifeView.layer.cornerRadius = 5;
        nightlifeView.backgroundColor = UIColor(red: 1/255, green: 18/255, blue: 107/255, alpha: 0.3)

        
        downtownView.layer.borderWidth = 5;
        downtownView.layer.borderColor =  UIColor(red: 255/255, green: 197/255, blue: 38/255, alpha: 1).CGColor
        downtownView.layer.cornerRadius = 5;
        downtownView.backgroundColor = UIColor(red: 1/255, green: 18/255, blue: 107/255, alpha: 0.3)
        
        
        campusView.layer.borderWidth = 5;
        campusView.layer.borderColor =  UIColor(red: 255/255, green: 197/255, blue: 38/255, alpha: 1).CGColor
        campusView.layer.cornerRadius = 5;
        campusView.backgroundColor = UIColor(red: 1/255, green: 18/255, blue: 107/255, alpha: 0.3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

