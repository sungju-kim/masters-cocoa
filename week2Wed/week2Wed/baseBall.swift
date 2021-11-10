//
//  baseBall.swift
//  week2Wed
//
//  Created by 성주 on 2021/11/10.
//

import Foundation

struct BaseBall {
    func newgame() {
        var numArr : Array<Int> = []
        while numArr.count < 3 {
            let answerNum = Int.random(in: 1...9)
            if numArr.contains(answerNum) {
                return
            }else {
                numArr.append(answerNum)
            }
        }
        print("숫자야구를 시작합니다")
        print(numArr)
        print("숫자 3자리를 입력해주세요 ex) 123 ")
        checkNum(arr: numArr)
    }

    func checkNum(arr : Array<Int> ) {
        let inputArr = Array(readLine()!).map{Int(String($0))!}
        var strikeCount = 0
        var ballCount = 0
        
        for i in 0...2 {
            if arr.contains(inputArr[i]) {
                if arr[i] == inputArr[i] {
                    strikeCount += 1
                }else {
                    ballCount += 1
                }
            }
        }
        printResult(strike : strikeCount, ball: ballCount, originArr: arr)
    }
    
    func printResult(strike : Int, ball : Int, originArr : Array<Int>) {
        print("\(strike) 스트라이크 \(ball) 볼")
        print("")
        if strike < 3 {
            print("숫자 3자리를 입력해주세요 ex) 123")
            print("")
            checkNum(arr: originArr)
        }else {
            print(" 맞췄습니다 !")
            print("")
            print(" 다시 하시겠습니까?  ex) y / n")
            print("")
            let tryAgain = readLine()
            guard let tryAgain = tryAgain else {
                return
            }
            if tryAgain == "y"{
                baseBall.newgame()
            }
                        
        }
    }
}

let baseBall = BaseBall()


