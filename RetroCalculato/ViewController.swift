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
    
    // Enum Variables
    
    var runningNumber: String = ""
    var currentOperation = Operation.Empty
    var leftValueSTR = ""
    var rightValueSTR = ""
    var result = ""
    
    enum Operation: String {
        
        case Add = "+"
        case Subtract = "-"
        case Multiply = "*"
        case Divide = "/"
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLBL: UILabel!
    
    // SFX for Digits
    
    @IBAction func BTNPressed(_ sender: UIButton) {
        
        playSound()
        
        runningNumber += String(sender.tag)
        
        outputLBL.text = runningNumber
    }
    
    // Proccess The type of Operation
    
    @IBAction func onAddPressed(_ sender: UIButton) {
        
        processOperation(.Add)
    }
    
    @IBAction func onSubstractPressed(_ sender: UIButton) {
        
        processOperation(.Subtract)
    }
    
    @IBAction func onMultiplyPressed(_ sender: UIButton) {
        
        processOperation(.Multiply)
    }
    
    @IBAction func onDividePressed(_ sender: UIButton) {
        
        processOperation(.Divide)
    }
    
    @IBAction func onEqualPressed(_ sender: UIButton) {
        
        processOperation(currentOperation) 
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
        
        outputLBL.text = String(0)
    }
    
    func playSound() {
        
        if btnSound.isPlaying {
            
            btnSound.stop()
        }
        
        btnSound.play()
    }
    
    func processOperation(_ operation: Operation) {
        
        if currentOperation != Operation.Empty {
            
            if runningNumber != "" {
                
                rightValueSTR = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Add {
                    
                    result = "\(Double(leftValueSTR)! + Double(rightValueSTR)!)"
                } else if currentOperation == Operation.Subtract {
                    
                    result = "\(Double(leftValueSTR)! - Double(rightValueSTR)!)"
                } else if currentOperation == Operation.Multiply {
                    
                    result = "\(Double(leftValueSTR)! * Double(rightValueSTR)!)"
                } else if currentOperation == Operation.Divide {
                    
                    result = "\(Double(leftValueSTR)! / Double(rightValueSTR)!)"
                }
                
                leftValueSTR = result
                
                outputLBL.text = result
                
                currentOperation = operation
            }
        } else {
            
            leftValueSTR = runningNumber
            runningNumber = ""
            
            currentOperation = operation
        }
        
         btnSound.play()
    }
}

