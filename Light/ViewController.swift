//
//  ViewController.swift
//  Light
//
//  Created by Alex Witkamp on 06-02-18.
//  Copyright © 2018 Alex Witkamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Boolean for the state of the light
    var lightOn = true
    
    // timer variables to create S.O.S. signal in morse code
    var sosCounter = 0
    var sosTimer = Timer()
    
    // action when screen is pressed
    @IBAction func buttonPressed(_ sender: Any) {
        
        // switch light variable
        lightOn = !lightOn
        
        // run update interface function
        updateUI()
        
        // reset S.O.S. signal
        sosTimer.invalidate()
        sosCounter = 0
    }
    
    // action when S.O.S. button is pressed
    @IBAction func buttonSOS(_ sender: Any) {
        
        // run only once, when counter of timer is 0
        if sosCounter == 0 {
            
            // start with lights off
            if lightOn == true
            {
                lightOn = !lightOn
                updateUI()
            }
    
            // set timer to 0.25 seconds
            sosTimer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        }
    }
    
    // S.O.S. function to create signal with UI
    @objc func runTimedCode() {
        
        // create the first S in morse code
        if sosCounter > 0 && sosCounter < 6
        {
            lightOn = !lightOn
            updateUI()
        }
        
        // create the O in morse code
        if sosCounter >= 6 && sosCounter < 20
        {
            if sosCounter % 2 == 0 {
            lightOn = !lightOn
            updateUI()
            }
        }
        
        // create the last S in morse code
        if sosCounter >= 20 && sosCounter < 26
        {
            lightOn = !lightOn
            updateUI()
        }
        
        // increment timer
        sosCounter += 1
        
        // stop S.O.S. signal
        if sosCounter >= 26 {
            sosTimer.invalidate()
            sosCounter = 0
        }
    }
    
    // update UI function
    func updateUI() {
        if lightOn == true
        {
            // change screen to white
            view.backgroundColor = .white
        }
        else
        {
            // change screen to black
            view.backgroundColor = .black
        }
    }
    
    // perfrom UI function at start of app
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

