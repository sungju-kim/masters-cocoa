//
//  ViewController.swift
//  measure
//
//  Created by 성주 on 2021/11/09.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var typeValue: UITextField!
    @IBOutlet weak var showValue: UILabel!
    @IBOutlet weak var beforeNum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func convertButton(_ value: Any) {
        let value = typeValue.text ?? "0"
        let double = Double(value) ?? 0.0
        let beforeConvert = Measurement(value: double, unit: UnitLength.centimeters)
        let afterConvert = beforeConvert.converted(to: UnitLength.meters)
        
        beforeNum.text = "\(beforeConvert)"
        showValue.text = "\(afterConvert)"
        typeValue.text = ""
        
    }
    
    
}

