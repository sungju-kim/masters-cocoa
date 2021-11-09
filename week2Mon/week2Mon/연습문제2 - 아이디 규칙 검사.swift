//
//  연습문제2 - 아이디 규칙 검사.swift
//  week2Mon
//
//  Created by 성주 on 2021/11/08.
//

import Foundation

struct IdCheck {
    func IDValidator(idInput : String) -> Bool {
        let regex = "^(?=.*[A-Za-z0-9])(?=.*[0-9]).{5,24}" // 5자리 ~ 24자리 영어+숫자+특수문자
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = predicate.evaluate(with: idInput)
        if isValid{
            return true
        } else {
            return false
        }
    }
    func printId() {
        let idInput = readLine()!
        if IDValidator(idInput: idInput) == true {
            print("true")
        }else {
            print(false)
        }
    }
}

let idCheck = IdCheck()
