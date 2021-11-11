//
//  ViewController.swift
//  단어 맞추기 앱
//
//  Created by 성주 on 2021/11/10.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nowWord: UILabel!
    @IBOutlet weak var typeWord: UITextField!
    @IBOutlet weak var nextWord: UILabel!
    
    var wordArr = ["사과","바나나","포도","딸기","파인애플","복숭아","수박","망고","블루베리","배"]
    override func viewDidLoad() {
        super.viewDidLoad()
        createWordArr()
        printLabel()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        self.typeWord.delegate = self
        // Do any additional setup after loading the view.
    }
    func createWordArr() {
        wordArr.shuffle()
    }
    func printLabel() {
        switch wordArr.count{
        case 0:
            nowWord.text = ""
            nextWord.text = ""
        case 1:
            nowWord.text = wordArr[0]
            nextWord.text = ""
        case 2...:
            nowWord.text = wordArr[0]
            nextWord.text = wordArr[1]
        default:
            break
        }
    }
    
    func checkWord(word : String) -> Int {
        while wordArr.count > 0{
            if word == nowWord.text{
                return 1
            }else if word != nowWord.text{
                return 0
            }
        }
        return 3
    }
    
    @IBAction func submitBtn(_ sender: Any) {
        guard let typedWord = typeWord.text else{return}
        switch checkWord(word: typedWord) {
        case 1 :
            nowWord.textColor = .black
            wordArr.removeFirst()
            printLabel()
            typeWord.text = ""
        case 0 :
            nowWord.textColor = .red
            typeWord.text = ""
        default:
            nowWord.textColor = .black
        }
    }
    
    @IBAction func rePlay(_ sender: Any) {
        wordArr = ["사과","바나나","포도","딸기","파인애플","복숭아","수박","망고","블루베리","배"]
        createWordArr()
        printLabel()
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.typeWord {
            self.submitBtn(self)
        }
        return true
    }
    
    
}

