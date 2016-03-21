//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum myOpt<T> {
    case SOME(T) //related value
    case NONE
}

var myo = myOpt<Int>.SOME(32)
myo = .NONE


switch myo {
case .SOME(let x):
    print("the value is : \(x)")
    
case .NONE:
    print("no value")
}




protocol CustomStringConvertible {
    var description: String { get }
}

enum Trade : CustomStringConvertible {
    case Buy, Sell
    
    var description: String {
        
        switch self {
        case .Buy:
            return "prop: Buy"
        case .Sell :
            return "prop: Sell"
        }
    }
}


var myTrade = Trade.Buy

myTrade.description

myTrade = .Sell

myTrade.description