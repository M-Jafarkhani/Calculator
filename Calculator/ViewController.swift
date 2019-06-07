//
//  ViewController.swift
//  Calculator
//
//  Created by Mahdi Jafarkhani on 4/1/19.
//  Copyright © 2019 Mahdi Jafarkhani. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    private var ctx : CalculatorContext!
    private var resetNumber : Bool = false
    private var decimalSymbolIsPressed : Bool = false
    private var digitsCountAfterDecimalSymbol : Int = 1
    private var zeroPressedCountAfterDecimalSymbol : Int = 0
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ctx = CalculatorContext()
        resultLabel.adjustsFontSizeToFitWidth = true;
        UpdateResultLabel(tag: ButtonType.clear.rawValue)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton)
    {
        switch sender.tag
        {
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
            if resetNumber
            {
                ResetNumberEvaluation()
            }
            if decimalSymbolIsPressed
            {
                if sender.tag == ButtonType.zero.rawValue
                {
                    zeroPressedCountAfterDecimalSymbol += 1
                }
                else
                {
                    zeroPressedCountAfterDecimalSymbol = 0
                }
                ctx.CurrentValue += (Double(sender.tag) * pow(10, Double(-1 * digitsCountAfterDecimalSymbol)))
                digitsCountAfterDecimalSymbol += 1
            }
            else
            {
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
            do
            {
                try ctx.Evaluate(opr: Addition())
            }
            catch
            {
                handleCalculationError(calculationError: error as! CalculationError)
            }
            resetNumber = true
            break
            
        case ButtonType.minus.rawValue :
            do
            {
                try ctx.Evaluate(opr: Subtraction())
            }
            catch
            {
                handleCalculationError(calculationError: error as! CalculationError)
            }
            resetNumber = true
            break
            
        case ButtonType.multiply.rawValue :
            do
            {
                try ctx.Evaluate(opr: Multiplication())
            }
            catch
            {
                handleCalculationError(calculationError: error as! CalculationError)
            }
            resetNumber = true
            break
            
        case ButtonType.division.rawValue :
            do
            {
                try ctx.Evaluate(opr: Division())
            }
            catch
            {
                handleCalculationError(calculationError: error as! CalculationError)
            }
            resetNumber = true
            break
            
        case ButtonType.equal.rawValue :
            do
            {
                try ctx.Calculate()
            }
            catch
            {
                handleCalculationError(calculationError: error as! CalculationError)
            }
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
        
        UpdateResultLabel(tag: sender.tag)
    }
    
    private func ResetNumberEvaluation() -> ()
    {
        ctx.CurrentValue = 0
        resetNumber = false
        ResetDecimalSymbolEvaluation()
    }
    
    private func ResetDecimalSymbolEvaluation() -> ()
    {
        decimalSymbolIsPressed = false
        digitsCountAfterDecimalSymbol = 1
        zeroPressedCountAfterDecimalSymbol = 0
    }
    
    private func Clear() -> ()
    {
        ctx.Reset()
        ResetDecimalSymbolEvaluation()
    }
    
    private func UpdateResultLabel(tag: Int) -> ()
    {
        let numberFormatter = NumberFormatter()
        numberFormatter.alwaysShowsDecimalSeparator = true
        numberFormatter.maximumFractionDigits = 15
        numberFormatter.numberStyle = .decimal
        
        let numberString = numberFormatter.string(from: NSNumber(value: ctx.CurrentValue));
        
        resultLabel.text = numberString
        
//        if (resultLabel.text?.contains("..."))!
//        {
//            numberFormatter.numberStyle = .scientific
//            numberFormatter.positiveFormat = "0.###E+0"
//            numberFormatter.exponentSymbol = "E"
//            numberString = numberFormatter.string(from: NSNumber(value: ctx.CurrentValue));
//        }
        
        if tag == ButtonType.zero.rawValue && decimalSymbolIsPressed
        {
            resultLabel.text!.append(String(repeating: "0", count: zeroPressedCountAfterDecimalSymbol))
        }
    }
    
    private func handleCalculationError(calculationError : CalculationError) -> ()
    {
        switch calculationError
        {
        case .unspecified:
            showError(errorDescription: "Unspecified error occurred.")
            
        case .divisionByZero:
            showError(errorDescription: "Division by zero.")
        }
    }
    
    private func showError(errorDescription: String) -> ()
    {
        ProgressHUD.showError(errorDescription)
    }
    
    private func numberWillBeTruncated(numberString: String, number : Double) -> Bool
    {
        return numberString.count > Int(resultLabel.bounds.size.width)
    }
}
