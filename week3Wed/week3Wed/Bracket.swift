//
//  Bracket.swift
//  week3Wed
//
//  Created by 성주 on 2021/11/17.
//

import Foundation

struct Brackets {
    enum Bracket :String{
        case round = "()"
        case square = "[]"
        case curly = "{}"
    }
    var leftBrk : String
    var rightBrk : String
    init(_ string : Bracket) {
        switch string{
        case .square:
            leftBrk = "["
            rightBrk = "]"
        case .curly:
            leftBrk = "{"
            rightBrk = "}"
        default:
            leftBrk = "("
            rightBrk = ")"
        }
    }
    
    func generate(with count:Int) -> Array<String> { // C5 = C0*C4 + C1*C3 + C2*C2 +C3*C1 + C4*C0
var arr : [String] = []
        if count == 0 {
            arr.append("")
        }
        for index in 0..<count{
            for left in generate(with: index) {
                for right in generate(with: count-index-1) {
                    arr.append("\(leftBrk)\(left)\(rightBrk)\(right)")
                }
            }
        }
        return arr
    }
    
    func analyze(with value: String) -> Bool {
        var count = 0
        for char in value{
            switch char{
            case "(", "{", "[":
                count += 1
            case ")", "}", "]":
                if count > 0{count -= 1}else{ return false}
            default:
               count += 0
            }
        }
        return count == 0 ? true : false
    }
}


