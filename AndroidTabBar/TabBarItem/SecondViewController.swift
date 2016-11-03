//
//  SecondViewController.swift
//  AndroidTabBar
//
//  Created by alfian on 20/09/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit
import Social

class SecondViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var alertButton: DefaultButton!
    @IBOutlet weak var dashedLineView: UIView!
    @IBOutlet weak var capsuleButton: CapsuleButton!

    init() {
        super.init(nibName: "SecondViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.profileImage.image = UIImage.backgroundImage()
        self.profileImage.circleMask()
        
        self.alertButton.setState(state: ButtonState.Enable)
        self.alertButton.addTarget(self, action: #selector(self.alertAction(_:)), forControlEvents: .TouchUpInside)
        self.capsuleButton.addTarget(self, action: #selector(self.sharingAction(_:)), forControlEvents: .TouchUpInside)
        self.capsuleButton.setState(state: ButtonState.Enable)
        self.dashedLineView.addDashedLine()
        self.capsuleButton.addDashedBorder(UIColor.redColor())
    }
    
    @objc private func alertAction(sender: UIButton) {
        self.alertButton.jitter()
        if #available(iOS 8.0, *) {
            let alert: UIAlertController = UIAlertController(title: "Ini Alert !", message: "You can see this Alert ?", preferredStyle: .ActionSheet)
                alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }
    }
    
    @objc private func sharingAction(sender: UIButton) {
        self.shareTextImageAndURL("Social sharing testing !", sharingImage: UIImage(named: "MTGdanmumford.jpg"), sharingURL: NSURL(string: "alfiansyah@go-jek.com"))
    }
}

extension UIView {
    func addDashedLine(color: UIColor = UIColor.lightGrayColor()) {
        self.backgroundColor = UIColor.clearColor()
        let cgColor = color.CGColor
        let shapeLayer: CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
            shapeLayer.name = "DashedTopLine"
            shapeLayer.bounds = shapeRect
            shapeLayer.position = CGPoint(x: frameSize.width / 2, y: frameSize.height / 2)
            shapeLayer.fillColor = UIColor.clearColor().CGColor
            shapeLayer.strokeColor = cgColor
            shapeLayer.lineWidth = 1
            shapeLayer.lineJoin = kCALineJoinRound
            shapeLayer.lineDashPattern = [4, 4]
        
        let path: CGMutablePathRef = CGPathCreateMutable()
            CGPathMoveToPoint(path, nil, 0, 0)
            CGPathAddLineToPoint(path, nil, self.frame.width, 0)
            shapeLayer.path = path
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func addDashedBorder(color: UIColor = UIColor.lightGrayColor()) {
        let color = color.CGColor
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
            shapeLayer.bounds = shapeRect
            shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
            shapeLayer.fillColor = UIColor.clearColor().CGColor
            shapeLayer.strokeColor = color
            shapeLayer.lineWidth = 1
            shapeLayer.lineJoin = kCALineJoinRound
            shapeLayer.lineDashPattern = [4, 4]
            shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: self.layer.cornerRadius).CGPath
        
        self.layer.addSublayer(shapeLayer)
    }
}

extension UIViewController {
    func shareTextImageAndURL(sharingText: String?, sharingImage: UIImage?, sharingURL: NSURL?) {
        var sharingItems = [AnyObject]()
        
        if let text = sharingText {
            sharingItems.append(text)
        }
        if let image = sharingImage {
            sharingItems.append(image)
        }
        if let url = sharingURL {
            sharingItems.append(url)
        }
        
        let activityViewController = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
            activityViewController.completionHandler = {(activityType, completed:Bool) in
                if completed {
                    print("Success")
                } else {
                    print("Failed")
                }
            }
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    func facebookShare(sharingText: String?, sharingImage: UIImage?, sharingURL: NSURL?) {
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
            if let text = sharingText {
                vc.setInitialText(text)
            }
            if let image = sharingImage {
                vc.addImage(image)
            }
            if let url = sharingURL {
                vc.addURL(url)
            }
            vc.completionHandler = {
                (result:SLComposeViewControllerResult) in
                if result == SLComposeViewControllerResult.Done {
                    print("Success sharing !")
                } else {
                    print("Cancel sharing !")
                }
            }
            self.presentViewController(vc, animated: true, completion: nil)
        }
    }
}