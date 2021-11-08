//
//  연습문제3 - 비밀번호 등급 확인.swift
//  week2Mon
//
//  Created by 성주 on 2021/11/08.
//

import Foundation

struct Password {
    func passwordValidator(password:String) -> Int {
        let passwordArr = password.map{($0)}
        let passwordLength = passwordArr.count
        var countNum = 0
        var countWord = 0
        var countSymbol = 0
        for i in 0...(passwordLength-1) {
            if(passwordArr[i].asciiValue! >= 97) && (passwordArr[i].asciiValue! <= 122) || (passwordArr[i].asciiValue! >= 65) && (passwordArr[i].asciiValue! <= 90) {  //영문자
                countWord += 1
            }else if (passwordArr[i].asciiValue! >= 48) && (passwordArr[i].asciiValue! <= 57) { //숫자
                countNum += 1
                
            }else if (passwordArr[i].asciiValue! >= 33) && (passwordArr[i].asciiValue! <= 126) { // 특수문자
                countSymbol += 1
            }
        }
        if (countNum > 1) && (countWord > 1) && (countSymbol > 1 ) && (passwordLength >= 8) {
            return 5
        }else if (countWord >= 1) && (countNum >= 1) && (passwordLength >= 8) {
            return 4
        }else if (countWord > 1) && (countWord == 0) && (passwordLength < 8) {
            return 2
        }else if (countNum == passwordLength) && (passwordLength < 8) {
            return 1
        }else {
            return 3
        }
        
    }
    func printResult() {
        let passwordInput = readLine()!
        print(passwordValidator(password: passwordInput))
    }
}
