//
//  main.swift
//  ladderGame
//
//  Created by 성주 on 2021/11/04.
//

import Foundation



struct Ladder {
    func playLadder(player : Int) {
        if player < 2 || player > 8 {
            return
        }
        printLadder(player: player)
    }
    func printLadder(player : Int){
        let row = player
        var ladderArr = Array(repeating: Array(repeating: "|", count: row), count: 5)
        for i in 0...4 {
            if i != 4 {
                for j in 0...row-1{
                    let orNot = Int.random(in: 0...1)
                    let randomNum1 = randomNum(player: player, orNot: orNot)
                    let randomNum2 = randomNum(player: player, orNot: orNot)
                    if j == randomNum1 || j == randomNum2 {
                        print(ladderArr[i][j], terminator: "-")
                    }else{
                        print(ladderArr[i][j], terminator: " ")
                    }
                }
                print("")
            }else{
                let winning = Int.random(in: 0...player-1)
                for j in 0...row-1{
                    if j == winning {
                        print("o", terminator: " ")
                    }else{
                        print("x", terminator: " ")
                    }
                }
            }
        }
    }
    func randomNum(player : Int, orNot : Int) -> Int {
        var randomNum : Int = 0
        let between = player - 2
        if player < 4 {
            if orNot == 1 {
                randomNum = Int.random(in: 0...between)
            }else {
                randomNum = player
            }
        }else{
            randomNum = Int.random(in: 0...between)
        }
        return randomNum
    }
}
print("인원수를 입력하세요 ( 2 ~ 8 ) ex) 5")
var playerNum = Int(readLine() ?? "0")
var ladder  = Ladder()
ladder.playLadder(player: playerNum ?? 0 )
