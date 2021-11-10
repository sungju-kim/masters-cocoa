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
        
        return Double(amount) + (Double(amount) * getInterestRate(byDay: day))
        
    }
}
