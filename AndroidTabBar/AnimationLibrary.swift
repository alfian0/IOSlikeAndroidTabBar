//
//  AnimationLibrary.swift
//  AndroidTabBar
//
//  Created by alfian on 04/10/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

protocol Jitterable {}

extension Jitterable where Self: UIView {
    func jitter() {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.05
            animation.repeatCount = 5
            animation.autoreverses = true
            animation.fromValue = NSValue(CGPoint: CGPoint.init(x: self.center.x - 5.0, y: self.center.y))
            animation.toValue = NSValue(CGPoint: CGPoint.init(x: self.center.x + 5.0, y: self.center.y))
        layer.addAnimation(animation, forKey: "position")
    }
}

protocol Flashable {}

extension Flashable where Self: UIView {
    func flash() {
        UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseIn, animations: {
            self.alpha = 1
        }) { (animationComplete) in
            if animationComplete {
                UIView.animateWithDuration(0.3, delay: 0.2, options: .CurveEaseOut, animations: {
                    self.alpha = 0.0
                    }, completion: nil)
            }
        }
    }
}

enum ButtonState: Int {
    case None = -1
    case Enable = 0
    case Disable = 1
}

class DefaultButton: UIButton, Jitterable {
    override func awakeFromNib() {
        self.setState(state: ButtonState.Enable)
    }
    
    func setState(state type: ButtonState) {
        switch(type) {
        case ButtonState.Enable:
            self.tintColor = UIColor.whiteColor()
            self.backgroundColor = UIColor._baseColor()
            self.enabled = true
            break
        case ButtonState.Disable:
            self.tintColor = UIColor.whiteColor()
            self.backgroundColor = UIColor._baseColor()
            self.enabled = false
            break
        default:
            break
        }
    }
}

class CapsuleButton: DefaultButton {
    override func awakeFromNib() {
        self.setState(state: ButtonState.Disable)
        
        self.layer.cornerRadius = self.frame.size.height / 2
    }
}