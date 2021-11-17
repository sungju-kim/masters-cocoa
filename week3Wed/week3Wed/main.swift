//
//  main.swift
//  week3Wed
//
//  Created by 성주 on 2021/11/17.
//

import Foundation

//let bracket = Brackets(.round)
//print(bracket.analyze(with: "())()(("))
//print(bracket.generate(with: 3))

print(sum(value: 0.001, repeat: 1000))

let x = 6.5

print(x.rounded(.toNearestOrAwayFromZero))
print(x.rounded(.towardZero))
print(x.rounded(.up))
print(x.rounded(.down))
