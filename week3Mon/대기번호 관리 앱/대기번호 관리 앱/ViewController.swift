//
//  ViewController.swift
//  대기번호 관리 앱
//
//  Created by 성주 on 2021/11/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var waitingCounter: UILabel!
    @IBOutlet weak var waitingBtn: UIButton!
    @IBOutlet weak var completeBtn: UIButton!
    @IBOutlet weak var waitingProgress: UIProgressView!
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        completeBtn.isEnabled = false
        waitingProgress.progress = 0.0
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func pressedBtn(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else {return}
        if title == "대기" {
            counter += 1
        }else if title == "완료"{
            counter -= 1
        }
        printLabel()
        printProgress()
        setEnable()
        colorLabel()
    }
    func printLabel() {
        switch counter {
        case 0...9:
            waitingCounter.text = "0\(counter) 명"
        case 10...:
            waitingCounter.text = "\(counter) 명"
        default:
            waitingCounter.text = "00 명"
        }
    }
    func printProgress() {
        waitingProgress.setProgress(Float(counter)/20, animated: true)
    }
    func setEnable() {
        waitingBtn.isEnabled = counter < 20
        completeBtn.isEnabled = counter > 0
    }
    func colorLabel() {
        switch counter{
        case 20:
            waitingCounter.textColor = .red
            waitingProgress.progressTintColor = .red
        default :
            waitingCounter.textColor = .black
            waitingProgress.progressTintColor = .blue
        }
    }
    
}

