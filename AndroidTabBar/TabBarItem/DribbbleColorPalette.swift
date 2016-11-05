//
//  DribbbleColorPalette.swift
//  AndroidTabBar
//
//  Created by alfian on 06/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

extension UIColor {
    public class func darkGrayDribble() -> UIColor {
        return UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
    }
    
    public class func mediumDarkGrayDribble() -> UIColor {
        return UIColor(red: 68/255, green: 68/255, blue: 68/255, alpha: 1.0)
    }
    
    public class func lightGrayDribble() -> UIColor {
        return UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
    }
    
    public class func mediumLightGrayDribble() -> UIColor {
        return UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1.0)
    }
    
    public class func veryLightGrayDribble() -> UIColor {
        return UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1.0)
    }
    
    public class func pinkDribble() -> UIColor {
        return UIColor(red: 234/255, green: 76/255, blue: 137/255, alpha: 1.0)
    }

    public class func blueLinkDribble() -> UIColor {
        return UIColor(red: 58/255, green: 139/255, blue: 187/255, alpha: 1.0)
    }
}

class dribbblePinkButton: UIButton {
    override func awakeFromNib() {
        self.layer.cornerRadius = 5
        self.setState(state: ButtonState.Enable)
        if #available(iOS 8.2, *) {
            self.titleLabel?.font = UIFont.systemFontOfSize(14, weight: 5)
        } else {
            // Fallback on earlier versions
        }
    }
    
    func setState(state state: ButtonState) {
        switch(state) {
        case ButtonState.Enable:
            self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            self.backgroundColor = UIColor.pinkDribble()
            self.alpha = 1.0
            self.enabled = true
            break
        case ButtonState.Disable:
            self.backgroundColor = UIColor.clearColor()
            self.alpha = 0.5
            self.enabled = false
            break
        default:
            break
        }
    }
}

class dribbbleGrayButton: UIButton {
    override func awakeFromNib() {
        self.layer.cornerRadius = 5
        self.setState(state: ButtonState.Enable)
        if #available(iOS 8.2, *) {
            self.titleLabel?.font = UIFont.systemFontOfSize(14, weight: 5)
        } else {
            // Fallback on earlier versions
        }
    }
    
    func setState(state state: ButtonState) {
        switch(state) {
        case ButtonState.Enable:
            self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            self.backgroundColor = UIColor.lightGrayDribble()
            self.alpha = 1.0
            self.enabled = true
            break
        case ButtonState.Disable:
            self.backgroundColor = UIColor.clearColor()
            self.alpha = 0.5
            self.enabled = false
            break
        default:
            break
        }
    }
}