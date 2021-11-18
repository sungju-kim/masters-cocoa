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
    
    struct Calculator {
        func add(_ num1 : Double, _ num2: Double)->Double{
            return num1 + num2
        }
        func minus(_ num1 : Double, _ num2: Double)->Double {
            return num1 - num2
        }
        func divide(_ num1 : Double, _ num2: Double)->Double {
            return num1 / num2
        }
        func multiply(_ num1 : Double, _ num2: Double)->Double {
            return num1 * num2
        }
    }
    let myCalculator = Calculator()
    
    var numStack : [Double] = []
    var calCount = 0
    var lastInput : String = ""
    var lastOperator : String = ""
    var operatorStack : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        guard let btn = sender.titleLabel?.text else {return}
        paintLabel(btn)
        
    }
    func paintLabel(_ text : String){
        if lastInput == "="{
            resultLabel.text = ""
        }
        switch text{
        case "0","1","2","3","4","5","6","7","8","9":
            if resultLabel.text == "0"{resultLabel.text = ""}
            resultLabel.text = resultLabel.text! + text
            lastInput = text
        case ".":
            if lastInput == ""{
                resultLabel.text = "0"+text
            }else if !resultLabel.text!.contains(".") && lastInput != "."{
                resultLabel.text = resultLabel.text! + text
                lastInput = text
            }
        default:
            resultLabel.text = "text"
        }
    }
    @IBAction func operatorBtn(_ sender: UIButton) {
        guard let btn = sender.titleLabel?.text else {return}
        guard let number = Double(resultLabel.text ?? "0") else {return}
        if (numStack.isEmpty || lastOperator == "=") && operatorStack.isEmpty {
            operatorStack.append(btn)
            if btn != "=" && number != 0 {
                numStack.append(number)
                loadStack()
                resultLabel.text = ""
            }else{
                resultLabel.text = ""
            }
        }else if btn == "="{
            lastInput = btn
            lastOperator = btn
            numStack.append(number)
            calculate()
            loadStack()
            resultLabel.text = String(numStack.last!)
            calCount += 1
            
        }else {
            operatorStack.append(btn)
            numStack.append(number)
            calculate()
            loadStack()
            resultLabel.text = ""
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
            numStack[calCount] = 0
            
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
    @IBAction func resetBtn(_ sender: Any) {
        numStack = []
        operatorStack = []
        calCount = 0
        lastInput = ""
        resultLabel.text = ""
        lastOperator = ""
        stack1.text = "Stack 1"
        stack2.text = "Stack 2"
        stack3.text = "Stack 3"
        stack4.text = "Stack 4"
        stack5.text = "Stack 5"
        
    }
    
}

