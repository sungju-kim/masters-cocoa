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
    
    struct Stack<T> {
        var stack: [T] = []
        var count: Int {
            return stack.count
        }
        var isEmpty : Bool {
            return stack.isEmpty
        }
        mutating func push(_ element:T){
            stack.append(element)
        }
        mutating func pop() -> T? {
            return isEmpty ? nil : stack.popLast()
        }
        mutating func popFirst() -> T? {
            return isEmpty ? nil : stack.removeFirst()
        }
    }
    
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
    
    var inputStack = Stack<Double>()
    var resultStack = Stack<Double>()
    var operatorStack = Stack<String>()
    let myCalculator = Calculator()
    
    var lastInput : String = ""
    var lastOperator : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else {return}
        paintLabel(title)
    }
    
    @IBAction func operatorBtn(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else {return}
        guard let inputLabel = resultLabel.text else {return}
        if resultLabel.text == ""{
            return
        }
        switch title{
        case "=":
            resultLabel.text = String(calculate())
            stackNumber(inputLabel)
        default:
            operatorStack.push(title)
            if inputStack.count >= 1 {
                cal()
                stackNumber(inputLabel)
            }else if inputStack.count == 0{
                stackNumber(inputLabel)
            }
            resultLabel.text = ""
        }
    }
    
    @IBAction func resetBtn(_ sender: Any) {
        stack1.text = "Stack 1"
        stack2.text = "Stack 2"
        stack3.text = "Stack 3"
        stack4.text = "Stack 4"
        stack5.text = "Stack 5"
        inputStack.stack.removeAll()
        operatorStack.stack.removeAll()
        resultLabel.text = "0"
    }
    func paintLabel(_ text : String){
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
            resultLabel.text = ""
        }
    }
    func cal() {
        guard var num1 = inputStack.pop() else {return}
        num1 += Double(resultLabel.text!)!
        inputStack.push(num1)
        
    }
    
    func calculate() -> Double{
        guard let num1 = inputStack.popFirst() else {return 0}
        guard let num2 = inputStack.popFirst() else {return 0}
        guard let operatorS = operatorStack.pop() else {return 0}
        switch operatorS {
        case "+":
            return myCalculator.add(num1, num2)
        case "-":
            return myCalculator.minus(num1, num2)
        case "x":
            return myCalculator.multiply(num1, num2)
        case "÷":
            return myCalculator.divide(num1, num2)
        default :
            return 0
        }
        
    }
    func stackNumber(_ inputLabel:String) {
        inputStack.push(Double(inputLabel) ?? 0)
        print(inputStack.stack)
        switch inputStack.count {
        case 1:
            stack1.text = String(inputStack.stack[0])
        case 2:
            stack2.text = String(inputStack.stack[1])
        case 3:
            stack3.text = String(inputStack.stack[2])
        case 4:
            stack4.text = String(inputStack.stack[3])
        case 5:
            stack5.text = String(inputStack.stack[4])
        default:
            stack1.text = "Stack 1"
        }
        
    }
    
}


