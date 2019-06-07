//
//  Operations.swift
//  Calculator
//
//  Created by Mahdi Jafarkhani on 4/1/19.
//  Copyright © 2019 Mahdi Jafarkhani. All rights reserved.
//

import Foundation

class Addition : OperationProtocol
{
    func Execute(ctx: CalculatorContext) throws -> Double
    {
        let a = ctx.CurrentValue
        if ctx.NumbersHistory != nil && ctx.NumbersHistory.count > 0
        {
            guard let b = ctx.NumbersHistory.last else { return 0 }
            return a + b
        }
        return a
    }
}

class Subtraction : OperationProtocol
{
    func Execute(ctx: CalculatorContext) throws -> Double
    {
        let a = ctx.CurrentValue
        if ctx.NumbersHistory != nil && ctx.NumbersHistory.count > 0
        {
            guard let b = ctx.NumbersHistory.last else { return 0 }
            return b - a
        }
        return a
    }
}

class Multiplication : OperationProtocol
{
    func Execute(ctx: CalculatorContext) throws -> Double
    {
        let a = ctx.CurrentValue
        if ctx.NumbersHistory != nil && ctx.NumbersHistory.count > 0
        {
            guard let b = ctx.NumbersHistory.last else { return 0 }
            return a * b
        }
        return a
    }
}

class Division : OperationProtocol
{
    func Execute(ctx: CalculatorContext) throws -> Double
    {
        let a = ctx.CurrentValue
        if ctx.NumbersHistory != nil && ctx.NumbersHistory.count > 0
        {
            if a == 0
            {
                throw CalculationError.divisionByZero
            }
            guard let b = ctx.NumbersHistory.last else { return 1 }
            return b / a
        }
        return a
    }
}
