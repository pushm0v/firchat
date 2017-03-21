//
//  UIColor+RGB.swift
//  firchat
//
//  Created by Bherly Novrandy on 3/21/17.
//  Copyright © 2017 Bherly Novrandy. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
    
}
