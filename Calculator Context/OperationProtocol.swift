//
//  Operation.swift
//  Calculator
//
//  Created by Mahdi Jafarkhani on 4/1/19.
//  Copyright © 2019 Mahdi Jafarkhani. All rights reserved.
//

import Foundation

protocol OperationProtocol
{
    func Execute(ctx : CalculatorContext) throws -> Double
}
