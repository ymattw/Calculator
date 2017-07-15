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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var displayValue: Double {
        get {
            let x = Double(display.text!)
            return x != nil ? x! : 0
        }
        set {
            display.text = String(newValue)
        }
    }

    private var beginOfInput = true

    @IBAction func tapDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!

        if beginOfInput {
            display.text = digit
            beginOfInput = false
        } else {
            display.text = display.text! + digit
        }
    }

    private var calculator = Calculator()

    @IBAction func tapClear(_ sender: UIButton) {
        _ = calculator.clear()
        beginOfInput = true
        displayValue = 0
    }

    @IBAction func tapOperator(_ sender: UIButton) {
        let symbol = sender.currentTitle!

        calculator.setOperand(displayValue)

        let result = calculator.calc(symbol)

        if result != nil {
            displayValue = result!
        } else {
            beginOfInput = true
        }
    }
}
