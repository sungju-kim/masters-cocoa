//
//  연습문제1 - 배열_MISSION 3.swift
//  week2Mon
//
//  Created by 성주 on 2021/11/08.
//

import Foundation

struct MagicSquare {
    func makeMagieSquare(row:Int) -> Array<Array<Int>> {
        let num = row
        var magicSquare = Array(repeating: Array(repeating: 0, count: num), count: num)
        var magicRow = 0
        var magicColumn = Int(num/2)
        magicSquare[magicRow][magicColumn]=1
        var originalRow = 0
        var originalColumn = 0
        
        for i in 2...num*num{
            originalRow = magicRow
            originalColumn = magicColumn
            
            magicRow -= 1
            magicColumn += 1
            
            if magicRow < 0 {
                magicRow = num - 1
            }
            if magicColumn > num-1 {
                magicColumn = 0
            }
            if magicSquare[magicRow][magicColumn] == 0 {
                magicSquare[magicRow][magicColumn] = i
            }else{
                magicRow = originalRow+1
                magicColumn = originalColumn
                magicSquare[magicRow][magicColumn] = i
            }
        }
        return magicSquare
    }
    
    func printMagieSquare(array : Array<Array<Int>>, row : Int) {
        let length = row-1
        for i in 0...length {
            for j in 0...length {
                print(array[i][j], terminator: " ")
            }
            print("")
        }
    }
}


