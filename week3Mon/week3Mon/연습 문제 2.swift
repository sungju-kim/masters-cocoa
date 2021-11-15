//
//  연습 문제 2.swift
//  week3Mon
//
//  Created by 성주 on 2021/11/15.
//

import Foundation

struct BinaryNumber {
    private var values : [String] = []
    
    init(with total : Int) {
        let powedMax = pow(2.0, Double(total))
        let intMax = Int(powedMax)
        for i  in 0..<intMax{
            var item = String(i, radix : 2)
            if item.count != total {
                item = String(repeating: "0", count: (total-item.count)) + item
            }
            values.append(item)
        }
    }
    
    
    var count : Int {
        get {
            return values.count
        }
    }
    
    func find(by bitcount: Int) -> Array<String> {
        return values.filter{$0.filter{$0 == "1"}.count == bitcount}
    }
}




