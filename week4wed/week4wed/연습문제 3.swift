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
            let thread = Thread(target:self, selector: #selector(count(_:)), object: i)
            thread.start()
        }
        RunLoop.current.run()
    }
    @objc func count(_ i: String){
        print("\(i) = \(textToArr.filter{$0.contains(i)}.count) times in this text")
//        print(Thread.current)
    }
}


let wordFinder = WordFinder(filename: "/Users/KSJ/Desktop/bookfile.txt")

