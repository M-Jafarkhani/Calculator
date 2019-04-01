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

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ctx = CalculatorContext()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
            case ButtonType.zero.rawValue :
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
            break
            
            case ButtonType.one.rawValue :
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
                ctx.CurrentValue += 1
            break
            
            case ButtonType.two.rawValue :
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
                ctx.CurrentValue += 2
            break
            
            case ButtonType.three.rawValue :
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
                ctx.CurrentValue += 3
            break
            
            case ButtonType.four.rawValue :
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
                ctx.CurrentValue += 4
            break
            
            case ButtonType.five.rawValue :
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
                ctx.CurrentValue += 5
            break
            
            case ButtonType.six.rawValue :
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
                ctx.CurrentValue += 6
            break
            
            case ButtonType.seven.rawValue :
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
                ctx.CurrentValue += 7
            break
            
            case ButtonType.eight.rawValue :
                if (ctx.CurrentValue != 0) {
                        ctx.CurrentValue *= 10
                    }
                ctx.CurrentValue += 8
            break
            
            case ButtonType.nine.rawValue :
                if (ctx.CurrentValue != 0) {
                    ctx.CurrentValue *= 10
                }
                ctx.CurrentValue += 9
            break
            
            case ButtonType.plus.rawValue :

            break
            
            case ButtonType.clear.rawValue :
                Clear()
            break
            
            case ButtonType.clear.rawValue :
                print("0")
            
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

