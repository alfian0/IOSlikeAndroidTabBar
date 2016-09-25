//
//  FirstViewController.swift
//  AndroidTabBar
//
//  Created by alfian on 20/09/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!

    init() {
        super.init(nibName: "FirstViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nextButton.addTarget(self, action: #selector(self.nextAction(_:)), forControlEvents: .TouchUpInside)
    }
    
    @objc private func nextAction(sender: UIButton) {
        print("Next Button Bro !")
    }
}