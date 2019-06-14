//
//  ButtonType.swift
//  Calculator
//
//  Created by Mahdi Jafarkhani on 4/1/19.
//  Copyright © 2019 Mahdi Jafarkhani. All rights reserved.
//

public enum ButtonType : Int
{
    case zero = 0
    case decimal = 10
    case equal = 11
    case one = 1
    case two = 2
    case three = 3
    case plus = 12
    case four = 4
    case five = 5
    case six = 6
    case minus = 13
    case seven = 7
    case eight = 8
    case nine = 9
    case multiply = 14
    case clear = 15
    case plusMinus = 16
    case percent = 17
    case division = 18
}

public enum CalculationError : Error
{
    case unspecified
    case divisionByZero
}
