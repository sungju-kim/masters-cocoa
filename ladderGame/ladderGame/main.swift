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
        print(player)
    }
}
var playerNum = Int(readLine() ?? "0")
var ladder  = Ladder()

ladder.playLadder(player: playerNum ?? 0 )
