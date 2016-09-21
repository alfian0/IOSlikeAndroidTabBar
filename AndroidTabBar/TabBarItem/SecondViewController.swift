//
//  SecondViewController.swift
//  AndroidTabBar
//
//  Created by alfian on 20/09/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var alertButton: UIButton!

    init() {
        super.init(nibName: "SecondViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.alertButton.addTarget(self, action: #selector(self.alertAction(_:)), forControlEvents: .TouchUpInside)
    }
    
    @objc private func alertAction(sender: UIButton) {
        let alert: UIAlertController = UIAlertController(title: "Ini Alert !", message: "You can see this Alert ?", preferredStyle: .ActionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
