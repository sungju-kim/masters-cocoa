//
//  ViewController.swift
//  measure
//
//  Created by 성주 on 2021/11/09.
//

import UIKit
class ViewController: UIViewController{
    
    var units : [String] = [String]()
    
    
    
    
    
    @IBOutlet weak var popUpButton: UIButton!
    @IBOutlet weak var typeValue: UITextField!
    @IBOutlet weak var showValue: UILabel!
    @IBOutlet weak var beforeNum: UILabel!
    @IBOutlet weak var textIs: UILabel!
    @IBOutlet weak var showPicker: UITextField!
    @IBOutlet weak var showPicker2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        units = ["mm", "cm", "m", "km", "in", "ft", "yd", "mi"]
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    @IBAction func convertButton(_ value: Any) {
        let value = typeValue.text ?? "0"
        let double = Double(value) ?? 0.0
        let beforeConvert = Measurement(value: double, unit: UnitLength.centimeters)
        let afterConvert = beforeConvert.converted(to: UnitLength.meters)
        
        beforeNum.text = "\(beforeConvert)"
        textIs.text = "Is"
        showValue.text = "\(afterConvert)"
        typeValue.text = ""
        
    }
    
    
}

