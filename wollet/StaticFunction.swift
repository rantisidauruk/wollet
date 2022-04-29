//
//  StaticFunction.swift
//  wollet
//
//  Created by Ranti Sidauruk on 28/04/22.
//


import UIKit

class StaticFunction
{
    static func prepareWarning(warningMessage:String) -> UIAlertController
    {
        let alert = UIAlertController(title: "Warning", message: warningMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        return alert
    }
    
    static func isNumeric (_ string: String) -> Bool
    {
        if let _ = Double(string)
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    static func lengthAtLeast(string: String, atLeast: Int) -> Bool
    {
        return string.count >= atLeast
    }
    
    static func doubleToCurrency(_ number: Double) -> String
    {
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = "."
        numberFormatter.decimalSeparator = ","
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.groupingSize = 3
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: number))!
    }
}

