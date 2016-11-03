//
//  Image.swift
//  AndroidTabBar
//
//  Created by alfian on 04/10/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

extension UIImageView {
    func circleMask() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.contentMode = UIViewContentMode.ScaleAspectFill
        self.clipsToBounds = true
    }
}