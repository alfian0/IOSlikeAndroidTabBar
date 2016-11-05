//
//  ThirdViewController.swift
//  AndroidTabBar
//
//  Created by alfian on 20/09/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subNavBar: UIView!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var readMoreButton: UIButton!

    init() {
        super.init(nibName: "ThirdViewController", bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navBar.backgroundColor = UIColor.darkGrayDribble()
        self.titleLabel.textColor = UIColor.lightGrayDribble()
        self.subNavBar.backgroundColor = UIColor.mediumDarkGrayDribble()
        self.informationLabel.textColor = UIColor.mediumLightGrayDribble()
        self.messageLabel.textColor = UIColor.darkGrayDribble()
        self.readMoreButton.setTitleColor(UIColor.blueLinkDribble(), forState: UIControlState.Normal)
        if #available(iOS 8.2, *) {
            self.readMoreButton.titleLabel?.font = UIFont.systemFontOfSize(14, weight: 5)
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Alfiansyah3")
    }
}
