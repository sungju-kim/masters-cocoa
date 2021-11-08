//
//  연습문제1 - 배열_MISSION 1.swift
//  week2Mon
//
//  Created by 성주 on 2021/11/08.
//

import Foundation

struct ArrayPractice {
    func printArray(array : Array<Array<Int>>) {
        for i in 0...4 {
            print(array[i][(0...i)])
        }
    }
    
    
    func fillArray() -> Array<Array<Int>> {
        var numArray = Array(repeating: Array(repeating: 0, count: 5), count: 5)
        var num = 1
        for i in 0...4 {
            for j in 0...4 {
                numArray[i][j] = num
                num += 1
            }
        }
        print(numArray)
        return numArray
    }
}


