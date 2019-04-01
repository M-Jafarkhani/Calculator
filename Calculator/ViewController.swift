//
//  ViewController.swift
//  Calculator
//
//  Created by Mahdi Jafarkhani on 4/1/19.
//  Copyright © 2019 Mahdi Jafarkhani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ctx : CalculatorContext!
    var resetValue : Bool = false
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ctx = CalculatorContext()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
            case ButtonType.zero.rawValue :
                if resetValue {
                    ctx.CurrentValue = 0
                    resetValue = false
                }
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
            break
            
            case ButtonType.one.rawValue :
                if resetValue {
                    ctx.CurrentValue = 0
                    resetValue = false
                }
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
                ctx.CurrentValue += 1
            break
            
            case ButtonType.two.rawValue :
                if resetValue {
                    ctx.CurrentValue = 0
                    resetValue = false
                }
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
                ctx.CurrentValue += 2
            break
            
            case ButtonType.three.rawValue :
                if resetValue {
                    ctx.CurrentValue = 0
                    resetValue = false
                }
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
                ctx.CurrentValue += 3
            break
            
            case ButtonType.four.rawValue :
                if resetValue {
                    ctx.CurrentValue = 0
                    resetValue = false
                }
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
                ctx.CurrentValue += 4
            break
            
            case ButtonType.five.rawValue :
                if resetValue {
                    ctx.CurrentValue = 0
                    resetValue = false
                }
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
                ctx.CurrentValue += 5
            break
            
            case ButtonType.six.rawValue :
                if resetValue {
                    ctx.CurrentValue = 0
                    resetValue = false
                }
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
                ctx.CurrentValue += 6
            break
            
            case ButtonType.seven.rawValue :
                if resetValue {
                    ctx.CurrentValue = 0
                    resetValue = false
                }
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
                ctx.CurrentValue += 7
            break
            
            case ButtonType.eight.rawValue :
                if resetValue {
                    ctx.CurrentValue = 0
                    resetValue = false
                }
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
                ctx.CurrentValue += 8
            break
            
            case ButtonType.nine.rawValue :
                if resetValue {
                    ctx.CurrentValue = 0
                    resetValue = false
                }
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
                ctx.CurrentValue += 9
            break
            
            case ButtonType.plus.rawValue :
                ctx.Evaluate(opr: Addition())
                resetValue = true
            break
            
            case ButtonType.minus.rawValue :
                ctx.Evaluate(opr: Subtraction())
                resetValue = true
            break
            
            case ButtonType.multiply.rawValue :
                ctx.Evaluate(opr: Multiplication())
                resetValue = true
            break
            
            case ButtonType.division.rawValue :
                ctx.Evaluate(opr: Division())
                resetValue = true
            break
            
            case ButtonType.equal.rawValue :
                ctx.Calculate()
            break
            
            case ButtonType.clear.rawValue :
                Clear()
            break
            
            default :
                break
        }
        
        UpdateResultLabel()
    }
    
    func Clear(){
        ctx.Reset()
    }
    
    func UpdateResultLabel() {
        if (floor(ctx.CurrentValue) == ctx.CurrentValue) {
            resultLabel.text = "\(Int(ctx.CurrentValue))"
        }
        else {
            resultLabel.text = "\(ctx.CurrentValue)"
        }
    }
}

