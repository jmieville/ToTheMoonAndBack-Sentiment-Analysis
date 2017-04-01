//
//  TextToSpeechVC.swift
//  Sentiment Analysis
//
//  Created by Jean-Marc Kampol Mieville on 3/29/2560 BE.
//  Copyright © 2560 Jean-Marc Kampol Mieville. All rights reserved.
//

import UIKit
import TextToSpeechV1
import AVFoundation

class TextToSpeechVC: UIViewController {
    @IBOutlet weak var textFieldLabel: UITextField!
    @IBOutlet weak var speakButtonPressed: UIButton!
    
    @IBOutlet weak var voiceSegment: UISegmentedControl!
    

    @IBAction func speakButtonPressed(_ sender: Any) {
        NSLog(textFieldLabel.text! + voiceSegment.selectedSegmentIndex.description)
        
        // Add watson service
        let textToSpeech = TextToSpeech(username: userName, password: pwd)
        
        guard textFieldLabel.text != nil else {
            NSLog("Error")
            return
        }
        let text = textFieldLabel.text
        let failure = { (error: Error) in print(error)
        }
        let voice = ("0" == voiceSegment.selectedSegmentIndex.description ? SynthesisVoice.us_Michael : ( "1" == voiceSegment.selectedSegmentIndex.description ? SynthesisVoice.us_Allison : SynthesisVoice.gb_Kate))
        textToSpeech.synthesize(text!, voice: voice.rawValue, failure: failure) { data in
            do {
                var audioPlayer: AVAudioPlayer
                audioPlayer = try! AVAudioPlayer(data: data)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                sleep(10)
            } catch {
                NSLog("Something went terribly wrong")
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
