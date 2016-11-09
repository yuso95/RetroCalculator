//
//  ViewController.swift
//  RetroCalculato
//
//  Created by Younoussa Ousmane Abdou on 11/8/16.
//  Copyright © 2016 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var btnSound: AVAudioPlayer!
    
    @IBAction func BTNPressed(_ sender: UIButton) {
        
        playSound()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            
            btnSound.prepareToPlay()
        } catch let err as NSError {
            
            print(err.debugDescription)
        }
    }
    
    func playSound() {
        
        if btnSound.isPlaying {
            
            btnSound.stop()
        }
        
        btnSound.play()
    }
}

