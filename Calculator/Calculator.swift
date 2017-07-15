//
//  Calculator.swift
//  Calculator
//
//  Created by Matt Wang on 7/15/17.
//  Copyright © 2017 Joyus Studio. All rights reserved.
//

import Foundation

class Calculator {
    private var op1: Double? = nil
    private var op2: Double? = nil
    private var fn: ((Double, Double) -> Double)? = nil

    func clear() -> Double? {
        self.op1 = nil
        self.op2 = nil
        self.fn = nil
        return nil
    }

    func setOperand(_ operand: Double) {
        if self.op1 == nil {
            self.op1 = operand
        } else if self.op2 == nil {
            self.op2 = operand
        }
    }

    func calc(_ symbol: String) -> Double? {
        var result: Double? = nil

        switch symbol {
        case "+/-":
            if self.op2 != nil {
                self.op2 = -self.op2!
                result = self.op2!
            } else if self.op1 != nil {
                self.op1 = -self.op1!
                result = self.op1!
            } else {
                result = self.clear()
            }
        case "%":
            if self.op2 != nil {
                self.op2 = self.op2! / 100
                result = self.op2!
            } else if self.op1 != nil {
                self.op1 = self.op1! / 100
                result = self.op1!
            } else {
                result = self.clear()
            }
        case "+":
            self.fn = { $0 + $1 }
        case "-":
            self.fn = { $0 - $1 }
        case "*":
            self.fn = { $0 * $1 }
        case "/":
            self.fn = { $0 / $1 }
        case "=":
            if self.op1 == nil || self.op2 == nil || self.fn == nil {
                result = self.clear()
            } else {
                result = self.fn!(self.op1!, self.op2!)
                self.op1 = result
            }
        default:
            break
        }
        return result
    }
}
