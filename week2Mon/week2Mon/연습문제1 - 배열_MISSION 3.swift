//
//  연습문제1 - 배열_MISSION 3.swift
//  week2Mon
//
//  Created by 성주 on 2021/11/08.
//

import Foundation

struct MagicSquare {
    func makeMagieSquare(row:Int) ->Array<Array<Int>> {
        var magicSquare = Array(repeating: Array(repeating: 0, count: row) , count: row)
        let totalCount = row * row
        var count = 1
        let length = row-1
        var columnNum = Int.random(in: 0...length)
        var rowNum  = Int.random(in: 0...length)
        magicSquare[columnNum][rowNum] = count
        count += 1
        while count <= totalCount{
            if magicSquare[columnNum + 1 ][rowNum + 1 ] == 0{
                columnNum += 1
                rowNum += 1
                magicSquare[columnNum][rowNum] = count
                count += 1
            }else if magicSquare[columnNum][rowNum] != 0 {
                columnNum -= 1
                magicSquare[columnNum][rowNum] = count
            }
        }
        return magicSquare
    }

    func printMagieSquare(array : Array<Array<Int>>, row : Int) {
        let length = row-1
        for i in 0...length {
            for j in 0...length {
                print(array[i][j])
            }
        }
    }
}



