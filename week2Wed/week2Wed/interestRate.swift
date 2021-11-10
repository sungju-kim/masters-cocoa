//
//  interestRate.swift
//  week2Wed
//
//  Created by 성주 on 2021/11/10.
//

import Foundation

struct InterestRate {
    
    func getInterestRate(byDay : Int) -> Double {
        var interestRate : Double = 0
        
        switch byDay {
        case 0...90 :
            interestRate = 0.5
        case 91...180 :
            interestRate = 1
        case 181...364 :
            interestRate = 2
        case 365...:
            interestRate = 5.6
        default:
            interestRate = 0
        }
        return interestRate
    }
    
    func calcurateAmount(day: Int, amount: Int) -> Double {
        var amountWithInterest = Double(amount)
        amountWithInterest += (Double(amount) * (getInterestRate(byDay: day) / 100))
        return amountWithInterest
        
    }
    
    func testInterest(unitDay : Int) -> Double {
        let inputAmount = readLine()
        
        guard let inputAmount = inputAmount else {
            return 0
        }
        guard let intAmount = Int(inputAmount) else {
            return 0
        }

        for i in stride(from: 1, through: 365, by: unitDay) {
            print(calcurateAmount(day: i, amount: intAmount))
        }
        return 1
    }
}

let interestRate = InterestRate()

