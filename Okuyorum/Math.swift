//
//  Math.swift
//  Oku
//
//  Created by Abdurrahman AVCI on 06/12/15.
//  Copyright © 2015 Abdurrahman AVCI. All rights reserved.
//

import Foundation

class Math {
    class func random(max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max)))
    }
}