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
            navController.navigationBarHidden = false
            navController.navigationBar.barTintColor = UIColor(red: 38/255, green: 37/255, blue: 40/255, alpha: 1)
            navController.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
            navController.navigationBar.shadowImage = UIImage()
            navController.navigationBar.translucent = false
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}