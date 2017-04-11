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

        let customButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        
        customButton.addTarget(self, action: #selector(showNotification), for: UIControlEvents.touchUpInside)
        customButton.setImage(UIImage(named: "myVoice"), for: UIControlState())
        
        barButton.initWithButton(customButton)

        barButton.badgeValue = "2"
        barButton.badgeOriX = 13
        barButton.badgeOriY = -9
        
        navigationItem.leftBarButtonItem = barButton
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


    func showNotification() {

        barButton.removeBadge()
        barButton.resetBadge()
    }
    
    @IBAction func addNotification(_ sender: AnyObject) {
        
        barButton.badgeValue = String(Int(barButton.badgeValue)! + 1)
    }
    
    @IBAction func changeColor(_ sender: UIButton) {

        if sender.isSelected {
            
            barButton.badgeColor = UIColor.red
            barButton.badgeTextColor = UIColor.white
        }
        else {
            
            barButton.badgeColor = UIColor.white
            barButton.badgeTextColor = UIColor.black
        }
        
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func changePosition(_ sender: UIButton) {
        
        if (sender.isSelected) {
            
            barButton.badgeOriX = 13
            barButton.badgeOriY = -9
        }
        else {
            barButton.badgeOriX = -10
            barButton.badgeOriY = 5
        }
        sender.isSelected = !sender.isSelected
    }

    
}

