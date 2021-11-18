//
//  ViewController.swift
//  calculator
//
//  Created by 성주 on 2021/11/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var buttons: UIButton!
    @IBOutlet weak var stack5: UILabel!
    @IBOutlet weak var stack1: UILabel!
    @IBOutlet weak var stack2: UILabel!
    @IBOutlet weak var stack3: UILabel!
    @IBOutlet weak var stack4: UILabel!
    
    var numStack : [Double] = []
    var calCount = 0
    var lastInput : String = ""
    var lastOperator : String = ""
    var operatorStack : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            resetBtn(UIButton.self)
        }
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        guard let btn = sender.titleLabel?.text else {return}
        paintLabel(btn)
        
    }
    func paintLabel(_ text : String){
        if lastInput == "="{
            printLabel("")
        }
        switch text{
        case "0","1","2","3","4","5","6","7","8","9":
            if resultLabel.text == "0"{resultLabel.text = ""}
            resultLabel.text = resultLabel.text! + text
            lastInput = text
        case ".":
            if lastInput == ""{
                printLabel("0"+text)
            }else if !resultLabel.text!.contains(".") && lastInput != "."{
                printLabel(resultLabel.text! + text)
                lastInput = text
            }
        default:
            printLabel("\(text)")
        }
    }
    
    func printLabel(_ string : String) {
        resultLabel.text = string
    }
    @IBAction func operatorBtn(_ sender: UIButton) {
        guard let pressedBtn = sender.titleLabel?.text else {return}
        guard let number = Double(resultLabel.text ?? "0") else {return}
        let isFirstInput = numStack.isEmpty
        let newCalculation = lastOperator == "="
        let operatorIsValid = operatorStack.isEmpty
        let pressedBtnIsValid = pressedBtn != "="
        let inPutNumIsNotZero = number != 0
        
        if (isFirstInput || newCalculation) && operatorIsValid {
            operatorStack.append(pressedBtn)
            if pressedBtnIsValid && inPutNumIsNotZero {
                numStack.append(number)
                loadStack()
                printLabel("")
            }else{
                printLabel("")
            }
        }else if pressedBtn == "="{
            lastInput = pressedBtn
            lastOperator = pressedBtn
            numStack.append(number)
            calculate()
            loadStack()
            printLabel(String(numStack.last!))
            calCount += 1
            
        }else {
            operatorStack.append(pressedBtn)
            numStack.append(number)
            calculate()
            loadStack()
            printLabel("")
        }
        
    }
    
    func calculate(){
        switch operatorStack.removeFirst(){
        case"+":
            numStack[calCount] = numStack[calCount] + numStack.removeLast()
        case"-":
            numStack[calCount] = numStack[calCount] - numStack.removeLast()
        case"x":
            numStack[calCount] = numStack[calCount] * numStack.removeLast()
        case"÷":
            numStack[calCount] = numStack[calCount] / numStack.removeLast()
        default :
            return
        }
        
    }
    func loadStack(){
        let stackedIndex = numStack.count % 5
        switch stackedIndex{
        case 1:
            stack1.text = String(numStack[numStack.count - 1])
        case 2:
            stack2.text = String(numStack[numStack.count - 1])
        case 3:
            stack3.text = String(numStack[numStack.count - 1])
        case 4:
            stack4.text = String(numStack[numStack.count - 1])
        case 0:
            stack5.text = String(numStack[numStack.count - 1])
        default:
            stack1.text = ""
            stack2.text = ""
            stack3.text = ""
            stack4.text = ""
            stack5.text = ""
            
        }
    }
    @IBAction func removeOneString(_ sender: Any) {
        guard var newLabel = resultLabel.text else {return}
        if newLabel.count > 0{
            newLabel.removeLast()
            resultLabel.text = String(newLabel)
        }
    }
    @IBAction func resetBtn(_ sender: Any) {
        numStack = []
        operatorStack = []
        calCount = 0
        lastInput = ""
        printLabel("")
        lastOperator = ""
        stack1.text = "Stack 1"
        stack2.text = "Stack 2"
        stack3.text = "Stack 3"
        stack4.text = "Stack 4"
        stack5.text = "Stack 5"
    }
    
}


