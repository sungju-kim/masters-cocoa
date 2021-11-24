//
//  연습문제 3.swift
//  week4wed
//
//  Created by 성주 on 2021/11/24.
//

import Foundation

class WordFinder {
    
    func wordCounter(filename : String){
        let wordArr = ["대중", "경제", "재산", "자유", "국제",
                       "시장", "사상", "부자", "학자", "개인",
                       "욕망", "생활", "자원", "사람", "노동",
                       "인물", "소비", "사회", "이론", "새로운"]
        let contents = try!String(contentsOfFile: "\(filename)")
        let csv = contents.replacingOccurrences(of: "\r", with: "\n").replacingOccurrences(of: "\n\n", with: "\n").replacingOccurrences(of: "\n", with: "")
        let textToArr = csv.components(separatedBy: " ").map{$0}
        let thread = Thread{
            for i in wordArr{
                print("\(i) = \(textToArr.filter{$0 == i}.count) times in this text")
            }
        }
        thread.start()
        RunLoop.current.run()
    }
}


let wordFinder = WordFinder()
