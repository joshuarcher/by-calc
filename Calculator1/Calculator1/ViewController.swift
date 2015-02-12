//
//  ViewController.swift
//  Calculator1
//
//  Created by Joshua Archer on 1/29/15.
//  Copyright (c) 2015 Jarch. All rights reserved.
//
/*
x => 1st number
y => 2nd number
z => operator
if user presses a number
update the display
if user presses an operator
x = display
if y is empty
y = x
else
y = y (z) x
display y
z = operator
*/

import UIKit

class ViewController: UIViewController {
    var typing = false
    var operatorTyping = false
    var equalTyping = false
    let calc = CalcBrain()

    @IBOutlet weak var calcView: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func clearScreen(sender: AnyObject) {
        equalTyping = false
        operatorTyping = false
        calc.operand1 = 0
        calc.operand2 = 0
        typing = false
        calc.calculator = ""
        calcView.text = ""
        
    }
    
    
    @IBAction func operandTapped(sender: AnyObject) {
        
        var operand = sender.currentTitle
        
        if typing {
            calcView.text = calcView.text! + operand!!
        }
        else {
            calcView.text = operand
            typing = true
        }
    }
    @IBAction func operatorTapped(sender: AnyObject) {
        typing = false
        
        if operatorTyping {
            calc.operand2 = NSString(string: calcView.text!).doubleValue
            
            
            calcView.text = calc.calculate(calc.operand1, second: calc.operand2, calculation: calc.calculator).description
        }
        else {
            operatorTyping = true;
        }
        
        calc.operand1 = NSString(string: calcView.text!).doubleValue
        
        calc.calculator = sender.currentTitle!!
        
    }
    
    @IBAction func equalTapped(sender: AnyObject) {
 
        typing = false
        
        calc.operand2 = NSString(string: calcView.text!).doubleValue
        
        calcView.text = calc.calculate(calc.operand1, second: calc.operand2, calculation: calc.calculator).description
        
    }
    
    @IBAction func plusOrMinus(sender: AnyObject) {
        
        var number: Double = NSString(string: calcView.text!).doubleValue
        
        if number < 0 {
            calcView.text = fabs(number).description
        }
        else {
            calcView.text = (number * -1).description
        }
        
    }
    

    @IBAction func percentage(sender: AnyObject) {
        operatorTyping = false
        var number : Double = NSString(string: calcView.text!).doubleValue
        number = number / 100
        calcView.text = number.description

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

