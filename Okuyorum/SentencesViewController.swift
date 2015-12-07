//
//  SentencesViewController.swift
//  Oku
//
//  Created by Abdurrahman AVCI on 06/12/15.
//  Copyright © 2015 Abdurrahman AVCI. All rights reserved.
//

import AVFoundation
import UIKit

class SentencesViewController: UIViewController, AVSpeechSynthesizerDelegate {
    @IBOutlet weak var textLabel: UILabel!

    let synthesizer = AVSpeechSynthesizer()
    var text = ""
    var words = [String]()
    var ranges = [NSRange]()
    var index = -1

    override func viewDidLoad() {
        super.viewDidLoad()

        // initialize synthesizer
        synthesizer.delegate = self

        // set title
        self.navigationItem.title = "Cümle Alıştırmaları"

        // get next
        next()
    }

    override func viewWillAppear(animated: Bool) {
        if let navigationController = self.navigationController {
            navigationController.navigationBarHidden = false
            navigationController.toolbarHidden = false
        }
    }

    // MARK: AVSpeechSynthesizerDelegate
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didFinishSpeechUtterance utterance: AVSpeechUtterance) {
        performSelector(Selector("speak"), withObject: nil, afterDelay: 0.1)
    }

    // MARK: Actions

    @IBAction
    func next() {
        self.text = AppDelegate.instance().sentence()
        self.textLabel.text = self.text
        self.index = -1

        self.words = [String]()
        self.ranges = [NSRange]()

        let string = self.text as NSString

        string.enumerateSubstringsInRange(NSMakeRange(0, string.length), options: NSStringEnumerationOptions.ByWords) { (substring, range, _, _) -> () in
            if let substring = substring {
                self.words.append(substring)
                self.ranges.append(range)
            }
        }
    }

    @IBAction
    func speak() {
        // increase index
        self.index = self.index + 1

        // check words
        if self.index >= self.words.count {
            self.index = -1
            self.textLabel.text = self.text
        }
        else {
            let word = self.words[index], range = self.ranges[index]

            let attributedText = NSMutableAttributedString(string: self.text)
            attributedText.addAttribute(NSForegroundColorAttributeName, value: UIColor.orangeColor(), range: range)
            textLabel.attributedText = attributedText

            let utterance = AVSpeechUtterance(string: word)
            utterance.voice = AVSpeechSynthesisVoice(language: "tr-TR")
            utterance.rate = 0.5
            synthesizer.speakUtterance(utterance)
        }
    }

}
