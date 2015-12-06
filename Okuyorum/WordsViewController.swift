//
//  WordsViewController.swift
//  Oku
//
//  Created by Abdurrahman AVCI on 06/12/15.
//  Copyright © 2015 Abdurrahman AVCI. All rights reserved.
//

import AVFoundation
import UIKit

class WordsViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // set title
        self.navigationItem.title = "Kelime Alıştırmaları"

        // get next word
        textLabel.text = AppDelegate.instance().word()
    }

    override func viewWillAppear(animated: Bool) {
        if let navigationController = self.navigationController {
            navigationController.navigationBarHidden = false
            navigationController.toolbarHidden = false
        }
    }

    @IBAction func nextTapped(sender: AnyObject) {
        textLabel.text = AppDelegate.instance().word()
    }

    @IBAction func speakTapped(sender: AnyObject) {
        if let text = textLabel.text {
            let utterance = AVSpeechUtterance(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: "tr-TR")
            utterance.rate = 0.5

            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speakUtterance(utterance)
        }
    }
}
