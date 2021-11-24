//
//  연습문제 3.swift
//  week4wed
//
//  Created by 성주 on 2021/11/24.
//

import Foundation

class WordFinder {
    let wordArr = ["대중", "경제", "재산", "자유", "국제",
                   "시장", "사상", "부자", "학자", "개인",
                   "욕망", "생활", "자원", "사람", "노동",
                   "인물", "소비", "사회", "이론", "새로운"]
    var textToArr : [String] = []
    init(filename : String){
        let contents = try!String(contentsOfFile: "\(filename)")
        textToArr = contents.components(separatedBy: " ").map{$0}
    }
    func thread() {
        for i in wordArr{
            let thread = Thread{
//                if i == "경제" {
//                    for j in 0...999{
//                        print(j)
//                        print(Thread.current)
//                    }
//                }else {
                    print("\(i) = \(self.textToArr.filter{$0.contains(i)}.count) times in this text")
                    print(Thread.current)
//                }
            }
            thread.start()
        }
        RunLoop.current.run()
    }
}


let wordFinder = WordFinder(filename: "/Users/KSJ/Desktop/bookfile.txt")

