//
//  main.swift
//  week2Wed
//
//  Created by 성주 on 2021/11/10.
//

import Foundation



func testInterest(unitDay : Int) -> Double {
    let inputAmount = readLine()
    
    guard let inputAmount = inputAmount else {
        return 0
    }
    guard let intAmount = Int(inputAmount) else {
        return 0
    }

    for i in stride(from: 1, through: 365, by: unitDay) {
        print(interestRate.calcurateAmount(day: i, amount: intAmount))
    }
    return 1
}


testInterest(unitDay: 10)


