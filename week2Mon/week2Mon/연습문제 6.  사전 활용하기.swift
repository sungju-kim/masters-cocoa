//
//  연습문제 6.  사전 활용하기.swift
//  week2Mon
//
//  Created by 성주 on 2021/11/08.
//

import Foundation


struct UseDict {
    func duplicatedWords(inputWords: Array<String>) -> Array<String> {
        let length = inputWords.count
        var newArr : Array<String> = []
        for i in 0..<length {
            let nowArr = inputWords
            var count = (nowArr.filter{($0) == nowArr[i]}.count)
            if count > 1 {
                if newArr.contains(nowArr[i]) == false {
                    newArr.append(nowArr[i])
                }
            }
            count = 0
        }
        return newArr
    }
}

let useDict = UseDict()
