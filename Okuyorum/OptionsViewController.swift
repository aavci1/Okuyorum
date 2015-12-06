//
//  OptionsViewController.swift
//  Oku
//
//  Created by Abdurrahman AVCI on 06/12/15.
//  Copyright © 2015 Abdurrahman AVCI. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // set title
        self.navigationItem.title = "Seçenekler"
    }

    override func viewWillAppear(animated: Bool) {
        if let navigationController = self.navigationController {
            navigationController.navigationBarHidden = false
            navigationController.toolbarHidden = false
        }
    }
}
