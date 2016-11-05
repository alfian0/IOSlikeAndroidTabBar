//
//  FirstViewController.swift
//  AndroidTabBar
//
//  Created by alfian on 20/09/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    init() {
        super.init(nibName: "FirstViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Alfiansyah1")
        self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.OnDrag
    }
}