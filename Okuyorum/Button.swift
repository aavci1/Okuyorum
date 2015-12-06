//
//  Button.swift
//  Oku
//
//  Created by Abdurrahman AVCI on 06/12/15.
//  Copyright © 2015 Abdurrahman AVCI. All rights reserved.
//

import UIKit

@IBDesignable
class Button: UIButton {
    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.size.height * 0.25
    }
}
