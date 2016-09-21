//
//  AppDelegateExtension.swift
//  AndroidTabBar
//
//  Created by alfian on 20/09/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

extension AppDelegate {
    func storyBoardLess() {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        
        let viewController = ViewController()
        let navController = UINavigationController(rootViewController: viewController)
            navController.navigationBarHidden = true
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}