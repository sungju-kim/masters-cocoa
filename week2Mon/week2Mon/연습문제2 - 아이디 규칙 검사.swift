//
//  연습문제2 - 아이디 규칙 검사.swift
//  week2Mon
//
//  Created by 성주 on 2021/11/08.
//

import Foundation


func IDValidator(id : String) -> Bool {
    let regex = "^(?=.*[A-Za-z-0-9])(?=.*[0-9]).{8,24}" // 5자리 ~ 24자리 영어+숫자+특수문자

    let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
    let isValid = predicate.evaluate(with: input)
    if isValid{
        return true
    } else {
        return false
    }
}

