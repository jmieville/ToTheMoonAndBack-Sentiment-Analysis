//
//  ImageRecognitionVC.swift
//  Sentiment Analysis
//
//  Created by Jean-Marc Kampol Mieville on 3/27/2560 BE.
//  Copyright © 2560 Jean-Marc Kampol Mieville. All rights reserved.
//

import UIKit
import VisualRecognitionV3

class ImageRecognitionVC: UIViewController {
    
    @IBOutlet weak var textFieldLabel: UITextField!
    @IBOutlet weak var buttonLabel: UIButton!
    @IBOutlet weak var statusLabel: UILabel!

    var urlText = "https://pbs.twimg.com/media/Cb_ComqWAAEwbab.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func analysisButtonPressed(sender: UIButton) {
        NSLog("button pressed")
        guard textFieldLabel.text != nil, textFieldLabel.text != ""  else {
            print("failed here")
            return
        }
        var status = "waiting for Watson processing the URL : " + textFieldLabel.text!
        
        DispatchQueue.main.async {
            self.statusLabel.text = status
        }
        
        // call service
        let version = "2017-03-28"
        let visualRecognition = VisualRecognition(apiKey: visualRecognitionApiKey, version: version)
        let url = textFieldLabel.text!
        let failure = { (error: Error) in
            print(error)
        }
        visualRecognition.classify(imageFile: URL(string: url)!, failure: failure) { (classifiedImages) in
            //print classifiedImages
            DispatchQueue.main.async {
                status = "visual status :::::: " + (classifiedImages.images.description)
            }
            
            // detecting classification goes here
        }
        
        // get output
        self.statusLabel.text = " 1 : " + status
     }
}
