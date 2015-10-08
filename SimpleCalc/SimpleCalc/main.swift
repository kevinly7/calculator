//
//  main.swift
//  SimpleCalc
//
//  Created by Kevin Ly on 10/8/15.
//  Copyright © 2015 Kevin Ly. All rights reserved.
//

import Foundation

print("Hello, World!")

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Int {
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
}

var firstNum : Int = convert(input())
var operand : String = input()
var secondNum : Int = convert(input())

switch operand {
    case "+", "add":
        print(firstNum + secondNum)
    case "-", "sub":
        print(firstNum - secondNum)
    case "*", "mul":
        print(firstNum * secondNum)
    case "/", "div":
        print(firstNum / secondNum)
    case "%", "mod":
        print(firstNum % secondNum)
    default:
        print("You did not provide a valid operand.")
}