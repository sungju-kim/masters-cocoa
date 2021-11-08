//
//  main.swift
//  week2Mon
//
//  Created by 성주 on 2021/11/08.
//

import Foundation



let myArray = ArrayPractice()

//myArray.printArray(array:myArray.fillArray()) // 연습문제 1 - 배열 _ MISSION 1




var boolArray = BoolArray()

//boolArray.printArray(bArray: boolArray.buildArray(), newChar: "$") // 연습문제 1 - 배열 _ MISSION 2

var magicSquare = MagicSquare()

//magicSquare.printMagieSquare(array: magicSquare.makeMagieSquare(row: 5), row: 5)



let input = readLine()!
var idCheck = IDValidator(id: input)

//print(idCheck)
