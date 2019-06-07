//
//  CalculatorContext.swift
//  Calculator
//
//  Created by Mahdi Jafarkhani on 4/1/19.
//  Copyright © 2019 Mahdi Jafarkhani. All rights reserved.
//

import Foundation

class CalculatorContext
{
    var NumbersHistory : Array<Double>! = []
    var CurrentValue : Double = 0.0
    var CurrentOperation : OperationProtocol!
    
    init()
    {
         
    }
    
    func Calculate() throws -> ()
    {
        if CurrentOperation == nil
        {
            return
        }
        
        do
        {
            let val : Double = try CurrentOperation.Execute(ctx: self)
            NumbersHistory.append(CurrentValue)
            CurrentValue = val
            NumbersHistory.removeAll(keepingCapacity: false)
            CurrentOperation = nil
        }
        catch
        {
            throw error
        }
    }
    
    func Evaluate(opr : OperationProtocol) throws -> ()
    {
        CurrentOperation = opr
        do
        {
            let val : Double = try CurrentOperation.Execute(ctx: self)
            NumbersHistory.append(CurrentValue)
            CurrentValue = val
        }
        catch
        {
            throw error
        }
    }
    
    func Reset() -> ()
    {
        NumbersHistory.removeAll(keepingCapacity: false)
        CurrentValue = 0.0
        CurrentOperation = nil
    }
}
