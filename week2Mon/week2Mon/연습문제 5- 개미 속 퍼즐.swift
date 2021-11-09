//
//  연습문제 5- 개미 속 퍼즐.swift
//  week2Mon
//
//  Created by 성주 on 2021/11/08.
//

import Foundation

struct AntPuzzle {
    func antFuntion(inputArray : Array<Int> ) -> Array<Int> {
        let nowArray = inputArray
        let arrayLength = nowArray.count
        var newArr : Array<Int> = []
        var count = 1
        if arrayLength >= 1 {
            for i in 0...(arrayLength-1) {
                if i < (arrayLength-1) {
                    if nowArray[i] == nowArray[i+1] {
                        count += 1
                    }else{
                        newArr.append(nowArray[i])
                        newArr.append(count)
                        count = 1
                    }
                }else {
                    newArr.append(nowArray[i])
                    newArr.append(count)
                }
            }
        }else {
            
        }
        return newArr
    }
    func buildArray(line : Int) {
        var array : Array<Int> = [1]
        print(array)
        for _ in 0..<line-1 {
            print(antFuntion(inputArray: array))
            array = antFuntion(inputArray: array)
        }
    }
}

let antPuzzle = AntPuzzle()
