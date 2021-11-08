//
//  연습문제 5- 개미 속 퍼즐.swift
//  week2Mon
//
//  Created by 성주 on 2021/11/08.
//

import Foundation

struct AntPuzzle {
    func antFuntion(inputArray : Array<Int> ) -> Array<Int> {
        var nowArray = inputArray
        var newArr : Array<Int> = []
        while nowArray.count >= 1 {
            let firstObj = nowArray[0]
            var count = 1
            if nowArray[1] == firstObj {
                count += 1
            }
            
            newArr.append(nowArray[0])
            newArr.append(count)
        }
        return newArr
    }
    
    func buildArray(line : Int) {
        var array : Array<Int> = [1]
        for _ in 1...line {
            print(antFuntion(inputArray: array))
            array = antFuntion(inputArray: array)
        }
    }
}
