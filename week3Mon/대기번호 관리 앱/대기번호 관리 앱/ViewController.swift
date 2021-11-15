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
    @IBOutlet var waitingProgressBar: UIView!
    var counter = 0
    var progress = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        completeBtn.isEnabled = false
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func increaseWaiting(_ sender: Any) {
        completeBtn.isEnabled = true
        switch counter {
        case 0...8:
            counter += 1
            waitingCounter.text = "0\(counter) 명"
            
        case 9...18:
            counter += 1
            waitingCounter.text = "\(counter) 명"
        case 19:
            counter += 1
            waitingCounter.text = "\(counter) 명"
            waitingCounter.textColor = .red
            waitingBtn.isEnabled = false
        default:
            waitingCounter.text = "00 명"
        }
    }
    
    @IBAction func decreaseWaiting(_ sender: Any) {
        switch counter{
        case 1:
            counter -= 1
            waitingCounter.text = "0\(counter) 명"
            completeBtn.isEnabled = false
        case 2...9:
            counter -= 1
            waitingCounter.text = "0\(counter) 명"
        case 10...19:
            counter -= 1
            waitingCounter.text = "\(counter) 명"
        case 20:
            counter -= 1
            waitingCounter.text = "\(counter) 명"
            waitingCounter.textColor = .black
            waitingBtn.isEnabled = true
        default:
            waitingCounter.text = "00 명"
        }

    }
    
}

