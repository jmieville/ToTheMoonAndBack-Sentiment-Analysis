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
        let url = URL(string:textFieldLabel.text!)!
        let failure = { (error: Error) in
            print(error)
        }
        let groupToDispatch = DispatchGroup()
        visualRecognition.classify(imageFile:  url, failure: failure) { (classifiedImages) in
            //print classifiedImages
            groupToDispatch.enter()
            
            print(classifiedImages.images.description)
            status = "visual status :::::: " + (classifiedImages.images.description)
            
            // detecting classification goes here
            if (!classifiedImages.images.isEmpty && !classifiedImages.images[0].classifiers.isEmpty && !classifiedImages.images[0].classifiers[0].classes.isEmpty) {
                status = status + "###### clasification : " + classifiedImages.images[0].classifiers[0].classes[0].classification
            }
            
            // detecting faces
            if (classifiedImages.images[0].classifiers[0].classes[0].classification.isEmpty && "person" == classifiedImages.images[0].classifiers[0].classes[0].classification) {
                self.statusLabel.text = status + " ##### person found ######"
                visualRecognition.detectFaces(inImageFile: url, failure: failure, success: { (imagesWithFaces) in
                    // print (images wuth faces
                    if (!imagesWithFaces.images[0].faces.isEmpty) {
                        status = status + " ##### the person's age max : " + (imagesWithFaces.images[0].faces[0].age.max?.description)!
                        status = status + " age min : " + (imagesWithFaces.images[0].faces[0].age.min?.description)!
                        status = status + " person's gender :" + imagesWithFaces.images[0].faces[0].gender.gender
                        NSLog("faces :::::: ")
                        self.statusLabel.text = "3 : " + status
                    }
                })
            }
            groupToDispatch.leave()
            // get output
            groupToDispatch.notify(queue: DispatchQueue.main) {
                self.statusLabel.text = "3 : " + status
            }
        }

     }
}
