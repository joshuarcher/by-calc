//
//  CalcBrain.swift
//  Calculator1
//
//  Created by Joshua Archer on 2/4/15.
//  Copyright (c) 2015 Jarch. All rights reserved.
//

import Foundation

class CalcBrain {
    var operand1:Double
    var operand2:Double
    var calculator: String
    
    init () {
        self.operand1 = 0
        self.operand2 = 0
        self.calculator = ""
    }
    
    func calculate(first:Double, second:Double, calculation:String) -> Double {
        var answer:Double = 0
        
        switch calculation {
        case "+":
            answer = first + second
        case "-":
            answer = first - second
        case "*":
            answer = first * second
        case "/":
            answer = first / second
        default:
            answer = 0
        }
        
        return answer
    }
    
    
}

