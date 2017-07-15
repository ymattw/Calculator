//
//  ViewController.swift
//  Calculator
//
//  Created by Matt Wang on 7/15/17.
//  Copyright © 2017 Joyus Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var userInputting = false

    var displayValue: Double {
        get {
            let x = Double(display.text!)
            return x != nil ? x! : 0.0
        }
        set {
            display.text = String(newValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!

        if userInputting {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userInputting = true
        }
    }

    @IBAction func operate(_ sender: UIButton) {
        let op = sender.currentTitle!

        switch op {
        case "AC":
            displayValue = 0
        case "√":
            displayValue = sqrt(displayValue)
        case "%":
            break
        default:
            break
        }

        userInputting = false
    }
}
