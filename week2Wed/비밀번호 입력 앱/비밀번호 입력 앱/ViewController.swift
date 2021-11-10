//
//  ViewController.swift
//  비밀번호 입력 앱
//
//  Created by 성주 on 2021/11/10.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
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

    @objc func textFieldDidChange(textField : UITextField){
        guard let passwordInput = passwordInput.text else { return  }
        if passwordInput.count >= 1 {
            printColorOf(passwordGrade: passwordValidator(password: passwordInput))
        }else{
            printColorOf(passwordGrade: 6)
        }
    }
    
    func printColorOf(passwordGrade : Int) {
        switch passwordGrade {
        case 1 :
            levelView.backgroundColor = .red
            descriptionLabel.text = "아주 약한 암호"
        case 2 :
            levelView.backgroundColor = .orange
            descriptionLabel.text = "약한 암호"
        case 3 :
            levelView.backgroundColor = .yellow
            descriptionLabel.text = "보통 암호"
        case 4 :
            levelView.backgroundColor = .blue
            descriptionLabel.text = "강한 암호"
        case 5 :
            levelView.backgroundColor = .green
            descriptionLabel.text = "아주 강한 암호"
        default:
            levelView.backgroundColor = .secondarySystemBackground
            descriptionLabel.text = "암호 수준"
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passwordInput.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func removeText(){
        passwordInput.text = ""
        printColorOf(passwordGrade: 6)
    }
    
    
    @IBAction func verifyBtn(_ sender: Any) {
        guard var passwordInput = passwordInput.text else { return  }
        printColorOf(passwordGrade: passwordValidator(password: passwordInput))
        removeText()
    }
}

