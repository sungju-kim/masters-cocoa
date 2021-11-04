//
//  main.swift
//  ladderGame
//
//  Created by 성주 on 2021/11/04.
//

import Foundation



struct Ladder {
    func playLadder(player : Int, length : Int) {
        let ladder = length-1
        if (player < 2 || player > 8) || (ladder < 4 || ladder > 10) {
            return
        }
        printLadder(player: player, length: length)
    }
    func buildLadder(player : Int, length : Int) -> Array<Array<String>> {
        let ladderArr = Array(repeating: Array(repeating: "|", count: player), count: length)
        
        return ladderArr
    }
    func printLadder(player : Int, length : Int){
        let row = player-1
        let resultLine = length-1
        let ladderArr = buildLadder(player: player, length: length)
        for i in 0...resultLine {
            if i != resultLine {
                for j in 0...row{
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
                let winning = Int.random(in: 0...row)
                for j in 0...row{
                    if j == winning {
                        print("o", terminator: " ")
                    }else{
                        print("x", terminator: " ")
                    }
                }
                print("")
                print(" ")
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
print("")
print("사다리 길이를 입력하세요 (4 ~ 10) ")
var ladderLength = Int(readLine() ?? "4")! + 1
var ladder  = Ladder()
ladder.playLadder(player: playerNum ?? 0, length: ladderLength )
