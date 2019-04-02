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
    var resetNumber : Bool = false
    var decimalSymbolIsPressed : Bool = false
    var digitsCountAfterDecimalSymbol : Int = 1
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ctx = CalculatorContext()
        UpdateResultLabel()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
            case ButtonType.zero.rawValue ,
                 ButtonType.one.rawValue ,
                 ButtonType.two.rawValue ,
                 ButtonType.three.rawValue ,
                 ButtonType.four.rawValue ,
                 ButtonType.five.rawValue ,
                 ButtonType.six.rawValue ,
                 ButtonType.seven.rawValue ,
                 ButtonType.eight.rawValue ,
                 ButtonType.nine.rawValue :
                if resetNumber {
                    ResetNumberEvaluation()
                }
                if decimalSymbolIsPressed {
                    ctx.CurrentValue += (Double(sender.tag) * pow(10, Double(-1 * digitsCountAfterDecimalSymbol)))
                    digitsCountAfterDecimalSymbol += 1
                }
                else {
                    ctx.CurrentValue *= 10
                    ctx.CurrentValue += Double(sender.tag)
                }
            break
            
            case ButtonType.percent.rawValue :
                ctx.CurrentValue *= 0.01
            break
            
            case ButtonType.decimal.rawValue :
                decimalSymbolIsPressed = true
            break
            
            case ButtonType.plus.rawValue :
                ctx.Evaluate(opr: Addition())
                resetNumber = true
            break
            
            case ButtonType.minus.rawValue :
                ctx.Evaluate(opr: Subtraction())
                resetNumber = true
            break
            
            case ButtonType.multiply.rawValue :
                ctx.Evaluate(opr: Multiplication())
                resetNumber = true
            break
            
            case ButtonType.division.rawValue :
                ctx.Evaluate(opr: Division())
                resetNumber = true
            break
            
            case ButtonType.equal.rawValue :
                ctx.Calculate()
                ResetDecimalSymbolEvaluation()
            break
            
            case ButtonType.plusMinus.rawValue :
                ctx.CurrentValue *= -1
            break
            
            case ButtonType.clear.rawValue :
                Clear()
            break
            
            default :
                break
        }
        
        UpdateResultLabel()
    }
    
    func ResetNumberEvaluation() {
        ctx.CurrentValue = 0
        resetNumber = false
        ResetDecimalSymbolEvaluation()
    }
    
    func ResetDecimalSymbolEvaluation() {
        decimalSymbolIsPressed = false
        digitsCountAfterDecimalSymbol = 1
    }
    
    func Clear(){
        ctx.Reset()
        ResetDecimalSymbolEvaluation()
    }
    
    func UpdateResultLabel() {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.alwaysShowsDecimalSeparator = true
        currencyFormatter.maximumFractionDigits = 15
        currencyFormatter.numberStyle = .decimal
        if (floor(ctx.CurrentValue) == ctx.CurrentValue) {
            resultLabel.text = currencyFormatter.string(from: NSNumber(value: Int(ctx.CurrentValue)))
        }
        else {
            resultLabel.text = currencyFormatter.string(from: NSNumber(value: ctx.CurrentValue))
        }
    }
}

