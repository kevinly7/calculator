//
//  main.swift
//  SimpleCalc
//
//  Created by Kevin Ly on 10/6/15.
//  Copyright © 2015 Kevin Ly. All rights reserved.
//

import Foundation

println("Hello, World!")

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Int {
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
}

var firstNum:Int = convert(input())
var operand:String = input()
var secondNum:Int = convert(input())