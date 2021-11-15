//
//  연습 문제 3.swift
//  week3Mon
//
//  Created by 성주 on 2021/11/15.
//

import Foundation

class BubbleSort {
    let numArr : [Int]
    init(arr : [Int]) {
        numArr = arr
    }
    
    func sorted(isAscending: Bool) -> Array<Int> {
        var newArr = numArr
        let length = newArr.count
        for _ in 0..<length{
            for j in 0..<length-1{
                if isAscending == true {
                    if newArr[j] > newArr[j+1] {
                        swap(j, j+1)
                    }
                } else {
                    if newArr[j] < newArr[j+1]{
                        swap(j+1, j)
                    }
                }
            }
        }
        func swap(_ aIndex: Int,_ bIndex: Int) {
            let beforeSwap = newArr[aIndex]
            newArr[aIndex] = newArr[bIndex]
            newArr[bIndex] = beforeSwap
        }
        return newArr
    }
    
    
}



