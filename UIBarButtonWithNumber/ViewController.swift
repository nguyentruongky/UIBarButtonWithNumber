//
//  ViewController.swift
//  UIBarButtonWithNumber
//
//  Created by Ky Nguyen on 9/30/15.
//  Copyright © 2015 Ky Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var barButton = BarButtonNumber()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let customButton = UIButton(frame: CGRectMake(0, 0, 20, 20))
        
        customButton.addTarget(self, action: Selector("showNotification"), forControlEvents: UIControlEvents.TouchUpInside)
        customButton.setImage(UIImage(named: "myVoice"), forState: UIControlState.Normal)
        
        barButton.initWithButton(customButton)

        barButton.badgeValue = "2"
        barButton.badgeOriX = 13
        barButton.badgeOriY = -9
        
        self.navigationItem.leftBarButtonItem = barButton
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


    func showNotification() {
        
        print("show notification")
        
        barButton.removeBadge()
        barButton.resetBadge()
    }
    
    @IBAction func addNotification(sender: AnyObject) {
        
        barButton.badgeValue = String(Int(barButton.badgeValue)! + 1)
    }
    
    @IBAction func changeColor(sender: UIButton) {

        if sender.selected {
            
            barButton.badgeColor = UIColor.redColor()
            barButton.badgeTextColor = UIColor.whiteColor()
        }
        else {
            
            barButton.badgeColor = UIColor.whiteColor()
            barButton.badgeTextColor = UIColor.blackColor()
        }
        
        sender.selected = !sender.selected;
    }
    
    @IBAction func changePosition(sender: UIButton) {
        
        if (sender.selected) {
            
            barButton.badgeOriX = 13
            barButton.badgeOriY = -9
        }
        else {
            barButton.badgeOriX = -10
            barButton.badgeOriY = 5
        }
        sender.selected = !sender.selected;
    }

    
}

