//
//  main.swift
//  SimpleCalc
//
//  Created by Kevin Ly on 10/8/15.
//  Copyright © 2015 Kevin Ly. All rights reserved.
//

import Foundation

print("--SimpleCalc--")

print("Basic Operations (+,-,*,/): enter a number, hit (enter), enter an operation, hit (enter), enter the second number, hit (enter).")
print("")
print("Advanced Opeations: enter a number, or string of numbers, followed by an operations (count, avg, fact) and seperating each value with spaces")
print("")

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Int {
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
}

var test = "no"

repeat {
    let firstInput = input().characters.split{$0 == " "}.map(String.init)

    if (firstInput.count == 1) {
        let firstNum = Double(convert(firstInput[0]))
        let operand = input()
        let secondNum = Double(convert(input()))
        switch operand {
            case "+", "add":
                print("Answer: \(firstNum + secondNum)")
                print("")
            case "-", "sub":
                print("Answer: \(firstNum - secondNum)")
                print("")
            case "*", "mul":
                print("Answer: \(firstNum * secondNum)")
                print("")
            case "/", "div":
                print("Answer: \(firstNum / secondNum)")
                print("")
            case "%", "mod":
                print("Answer: \(firstNum % secondNum)")
                print("")
            default:
                print("You did not provide a valid operand.")
                print("")
        }
    } else {
        var arrayOfNumbers = [Int]()
        for var index = 0; index < firstInput.count - 1; index++ {
            arrayOfNumbers.append(convert(firstInput[index]))
        }
        let operand = firstInput[firstInput.count-1]
        switch operand {
            case "count":
                print("You entered \(arrayOfNumbers.count) numbers.")
                print("")
            case "avg":
                var avg : Double = 0;
                for var index = 0; index < arrayOfNumbers.count; index++ {
                    avg = avg + Double(arrayOfNumbers[index])
                }
                avg = avg / Double(arrayOfNumbers.count)
                print("The average is: \(avg)")
                print("")
            case "!", "fact":
                var fact = 1
                for var index = 1; index <= arrayOfNumbers[0]; index++ {
                    fact = fact * index
                }
                print("\(arrayOfNumbers[0]) factorial is: \(fact)")
                print("")
            default:
                print("You did not enter something valid.")
                print("")
        }
    }
    print("Would you like to calculate another problem: ", terminator: "")
    test = input()
    print("")
} while(test == "yes")