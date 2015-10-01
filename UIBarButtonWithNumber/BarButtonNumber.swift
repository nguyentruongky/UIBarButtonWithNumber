//
//  BarButtonNumber.swift
//  UIBarButtonWithNumber
//
//  Created by Ky Nguyen on 9/30/15.
//  Copyright © 2015 Ky Nguyen. All rights reserved.
//

import Foundation
import UIKit

class BarButtonNumber : UIBarButtonItem {

    var _badgeValue : String = ""
    var badgeValue: String {
        
        set {
            
            self._badgeValue = newValue
            
            if (_badgeValue == "" || _badgeValue == "0") {
                
                self.removeBadge()
            }
            else {
                
                self.badge.hidden = false
                self.badge.frame = CGRectMake(self.badgeOriX, self.badgeOriY, 20, 20)
                self.badge.textColor = _badgeTextColor
                self.badge.backgroundColor = _badgeColor
                self.badge.font = _badgeFont
                self.badge.textAlignment = NSTextAlignment.Center
                
                self.customView?.addSubview(self.badge)
                self.updateBadgeValueAnimated(true)
            }
        }

        get {

            return _badgeValue
        }
    }
    
    var _badgeColor: UIColor = UIColor.redColor()
    var badgeColor: UIColor {
        
        get {
            
            return self._badgeColor
        }
        
        set {
            
            self._badgeColor = newValue
            
            self.refreshBadge()
        }
    }
    
    var _badgeTextColor: UIColor = UIColor.whiteColor()
    var badgeTextColor: UIColor {
        
        get {
            
            return self._badgeTextColor
        }
        
        set {
            
            self._badgeTextColor = newValue
            
            self.refreshBadge()
        }

    }
    
    var _badgeFont: UIFont = UIFont.systemFontOfSize(10)
    var badgeFont : UIFont {
        
        get {
            
            return self._badgeFont
        }
        
        set {
            
            self._badgeFont = newValue
            
            self.refreshBadge()
        }
    }
    
    var _badgePadding: CGFloat = 3
    var badgePadding : CGFloat {
        
        get {
            
            return self._badgePadding
        }
        
        set {
            
            self._badgePadding = newValue
            
            self.refreshBadge()
        }
    }

    var _badgeMinSize: CGFloat = 0
    var badgeMinSize: CGFloat {
        
        get {
            
            return self._badgeMinSize
        }
        
        set {
            
            self._badgeMinSize = newValue
            
            self.refreshBadge()
        }
    }

    var _badgeOriX : CGFloat = 0
    var badgeOriX : CGFloat {
        
        get {
            
            return self._badgeOriX
        }
        
        set {
            
            self._badgeOriX = newValue
            
            self.updateBadgeFrame()
        }
    }
    
    var _badgeOriY : CGFloat = 0 
    var badgeOriY : CGFloat {
        
        get {
            
            return self._badgeOriY
        }
        
        set {
            
            self._badgeOriY = newValue
            
            updateBadgeFrame()
        }
    }
    
    var shouldHideBadgeAtZero = true
    
    var shouldAnimateBadge = true

    
    func initWithButton(button: UIButton) {
        
        self.customView = button
    }

    required init?(coder aDecoder: NSCoder) {

        super.init()
    }
    
    override init() {
        
        super.init()
    }
    
    var badge = UILabel()
    

    func updateBadgeFrame() {
        
        let frameLabel = badge
        frameLabel.sizeToFit()
        
        let expectedLabelSize = frameLabel.frame.size
        
        var minHeight = expectedLabelSize.height
        
        minHeight = minHeight < self.badgeMinSize ? self.badgeMinSize : minHeight
        
        var minWidth = expectedLabelSize.width

        let padding = self.badgePadding
        
        minWidth = minWidth < minHeight ? minHeight : minWidth
        
        self.badge.frame = CGRectMake(self.badgeOriX, self.badgeOriY, minWidth + padding, minHeight + padding)
        
        self.badge.layer.cornerRadius = (minHeight + padding) / 2
        self.badge.layer.masksToBounds = true
    }

    
    func refreshBadge() {
        
        badge.textColor = self.badgeTextColor
        badge.backgroundColor = self.badgeColor
        badge.font = self.badgeFont
    }
    
    func resetBadge() {
        
        badgeValue = "0"
    }

    
    func updateBadgeValueAnimated(animated: Bool) {
        
        if (animated && self.shouldAnimateBadge && !(self.badge.text == self.badgeValue)) {
            
            let animation = CABasicAnimation(keyPath: "transform.scale")
            animation.fromValue = 1.5
            animation.toValue = 1.0
            animation.duration = 0.2
            animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 1.3, 1, 1)
            
            self.badge.layer.addAnimation(animation, forKey: "bounceAnimation")
        }
        
        self.badge.text = self.badgeValue
        
        self.updateBadgeFrame()
    }
    
    func duplicateLabel(labelToCopy: UILabel) -> UILabel {
        
        let duplicateLabel = UILabel()
        duplicateLabel.text = labelToCopy.text
        duplicateLabel.font = labelToCopy.font
        
        return duplicateLabel
    }
    
    func removeBadge() {
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            
//                self.badge.transform = CGAffineTransformMakeScale(0, 0)
                self.badge.hidden = true            
            }) { (Bool) -> Void in
                
//                self.badge.hidden = true
        }
    }
}