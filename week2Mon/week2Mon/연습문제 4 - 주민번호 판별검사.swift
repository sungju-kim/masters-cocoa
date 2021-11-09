//
//  연습문제 4 - 주민번호 판별검사.swift
//  week2Mon
//
//  Created by 성주 on 2021/11/08.
//

import Foundation

struct CheckIdNum {
    func checkIsValid() -> Bool{
        let inputArr = readLine()!.filter{$0.isNumber}.map{$0}
        let lastNum = inputArr[12].wholeNumberValue!
        var valueNum = 0
        for i in 0...7 {
            let addNum = (inputArr[i].wholeNumberValue!) * (i+2)
            valueNum += addNum
        }
        for i in 8...11 {
            let addNum = (inputArr[i].wholeNumberValue!) * (i-6)
            valueNum += addNum
        }

        if (11-(valueNum % 11)) % 10 == lastNum {
            return true
        }else {
            
            return false
        }
    }
    func printResult() {
        if checkIsValid() == true {
            print(true)
        }else {
            print(false)
        }
    }
}

let checkIdNum = CheckIdNum()
