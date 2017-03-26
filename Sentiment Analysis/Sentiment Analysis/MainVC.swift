//
//  ViewController.swift
//  Sentiment Analysis
//
//  Created by Jean-Marc Kampol Mieville on 3/26/2560 BE.
//  Copyright © 2560 Jean-Marc Kampol Mieville. All rights reserved.
//

import UIKit
import AlchemyLanguageV1

class MainVC: UIViewController {

    @IBOutlet weak var textFieldLabel: UITextField!
    @IBOutlet weak var buttonLabel: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func checkButtonPressed(sender: UIButton) {
        NSLog(textFieldLabel.text!)
        
        // Check Sentiment
        let apiKey = "ef40cc854d6cd59e42c11dc9174b6e4257bff0ef"
        let alchemyLanguage = AlchemyLanguage(apiKey: apiKey)
        
        // alchemy language
        let url = textFieldLabel.text!
        let failure = { (error: NSError) in
            print(error)
        }
        NSLog("calling GetTextSentiment url ::::::::::")
        guard let definedURL = URL(string: url) else {
            return
        }
        alchemyLanguage.getTextSentiment(fromTextFile: definedURL, failure: failure) { (sentiment) in
            print(sentiment)
            NSLog((sentiment.docSentiment?.type)!)
            
            
        }
        
    }

}
