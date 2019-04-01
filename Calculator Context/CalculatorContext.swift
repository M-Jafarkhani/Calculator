//
//  CalculatorContext.swift
//  Calculator
//
//  Created by Mahdi Jafarkhani on 4/1/19.
//  Copyright © 2019 Mahdi Jafarkhani. All rights reserved.
//

import Foundation

class CalculatorContext{
    var NumbersHistory : Array<Double>! = []
    var CurrentValue : Double = 0.0
    var OperationsHistory : Array<OperationProtocol> = []
    var CurrentOperation : OperationProtocol!
    
    init() {
    }
    
    func Calculate(){
        if CurrentOperation == nil {
            return
        }
        
        let val : Double = CurrentOperation.Execute(ctx: self)
        NumbersHistory.append(CurrentValue)
        CurrentValue = val
        NumbersHistory.removeAll(keepingCapacity: false)
        OperationsHistory.removeAll(keepingCapacity: false)
        CurrentOperation = nil
    }
    
    func Evaluate(opr : OperationProtocol){
        CurrentOperation = opr
        OperationsHistory.append(opr)
        let val : Double = CurrentOperation.Execute(ctx: self)
        NumbersHistory.append(CurrentValue)
        CurrentValue = val
    }
    
    func Reset() {
        NumbersHistory.removeAll(keepingCapacity: false)
        CurrentValue = 0.0
        OperationsHistory.removeAll(keepingCapacity: false)
        CurrentOperation = nil
    }
}
