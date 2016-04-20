//
//  ViewController.swift
//  FTEmojiParser
//
//  Created by Florent TM on 19/04/2016.
//  Copyright © 2016 Florent THOMAS-MOREL. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.textView.delegate = self
    }

    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool{
        let customTriggerPonctuationSet = ";.?,! "
        if customTriggerPonctuationSet.containsString(text){
            self.textView.text = self.textView.lastParseStringForEmoji()
        }
        return true
    }

}

