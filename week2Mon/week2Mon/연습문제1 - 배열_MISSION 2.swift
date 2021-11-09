//
//  연습문제1 - 배열_MISSION 2.swift
//  week2Mon
//
//  Created by 성주 on 2021/11/08.
//

import Foundation


struct BoolArray {
    func printArray(bArray: Array<Array<String>>, newChar : Character){
        for i in 0...6 {
            for j in 0...6 {
                if bArray[i][j] == "f" {
                    print(" ", terminator: "")
                }else {
                    print(newChar, terminator: "")
                }
            }
            print("")
        }
    }
    func buildArray() -> Array<Array<String>> {
        var boolArray = Array(repeating: Array(repeating: "f", count: 7), count: 7)
        for i in 0...6 {
            for j in (6-i)...6 {
                boolArray[i][j] = "t"
            }
        }
        return boolArray
    }
    
}

var boolArray = BoolArray()
