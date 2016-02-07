//
//  ViewController.swift
//  Calculator
//
//  Created by Thomas Nys on 02/02/16.
//  Copyright © 2016 Thomas Nys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        switch operation {
        case "×":
            if (operandStack.count>=2) {
                displayValue = operandStack.removeLast() * operandStack.removeLast()
                enter()
            }
//        case "÷":
//        case "+":
//        case "−":
        default: break
        }
    }
    var operandStack = Array<Double>()
    @IBAction func enter(sender: AnyObject) {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("operandstack =\(operandStack)")
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
}
