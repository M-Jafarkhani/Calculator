//
//  Operations.swift
//  Calculator
//
//  Created by Mahdi Jafarkhani on 4/1/19.
//  Copyright © 2019 Mahdi Jafarkhani. All rights reserved.
//

import Foundation

class AddOperation : OperationProtocol {
    func Execute(ctx: CalculatorContext) -> Double {
        let a = ctx.CurrentValue
        if (ctx.NumbersHistory != nil && ctx.NumbersHistory.count > 1)
        {
            guard let b = ctx.NumbersHistory.last else { return 0 }
            return a + b
        }
        return a
    }
}
