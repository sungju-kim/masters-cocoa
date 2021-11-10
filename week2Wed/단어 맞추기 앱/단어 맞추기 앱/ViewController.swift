//
//  ViewController.swift
//  단어 맞추기 앱
//
//  Created by 성주 on 2021/11/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nowWord: UILabel!
    @IBOutlet weak var typeWord: UITextField!
    @IBOutlet weak var nextWord: UILabel!
    
    var wordArr = ["사과","바나나","포도","딸기","파인애플","복숭아","수박","망고","블루베리","배"]

        func newGame() {
            wordArr.shuffle()
            printLabel()
        }

        func printLabel() {
            nowWord.text = wordArr[0]
            nextWord.text = wordArr[1]
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitBtn(_ sender: Any) {
        guard let
    }
    
}

