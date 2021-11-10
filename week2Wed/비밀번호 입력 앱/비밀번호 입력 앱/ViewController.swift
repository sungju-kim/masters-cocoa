//
//  ViewController.swift
//  비밀번호 입력 앱
//
//  Created by 성주 on 2021/11/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func passwordValidator(password:String) -> Int {
            let passwordArr = password.map{($0)}
            let passwordLength = passwordArr.count
            var countNum = 0
            var countWord = 0
            var countSymbol = 0
            for i in 0...(passwordLength-1) {
                if(passwordArr[i].asciiValue! >= 97) && (passwordArr[i].asciiValue! <= 122) || (passwordArr[i].asciiValue! >= 65) && (passwordArr[i].asciiValue! <= 90) {  //영문자
                    countWord += 1
                }else if (passwordArr[i].asciiValue! >= 48) && (passwordArr[i].asciiValue! <= 57) { //숫자
                    countNum += 1
                    
                }else if (passwordArr[i].asciiValue! >= 33) && (passwordArr[i].asciiValue! <= 126) { // 특수문자
                    countSymbol += 1
                }
            }
            if (countNum > 1) && (countWord > 1) && (countSymbol > 1 ) && (passwordLength >= 8) {
                return 5
            }else if (countWord >= 1) && (countNum >= 1) && (passwordLength >= 8) {
                return 4
            }else if (countWord > 1) && (countWord == 0) && (passwordLength < 8) {
                return 2
            }else if (countNum == passwordLength) && (passwordLength < 8) {
                return 1
            }else {
                return 3
            }
            
        }
        func printResult() {
            guard let passwordInput = passwordInput.text else { return  }
            print(passwordInput)
            print(passwordValidator(password: passwordInput))
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func verifyBtn(_ sender: Any) {
    }
}

