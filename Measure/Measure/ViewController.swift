//
//  ViewController.swift
//  measure
//
//  Created by 성주 on 2021/11/09.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
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
        createPickerView()
        dismissPickerView()
        units = ["mm", "cm", "m", "km", "in", "ft", "yd", "mi"]
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return units.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return units[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        showPicker.text = units[row]
        
    }
    func createPickerView () {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        showPicker.inputView = pickerView
    }
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        showPicker.inputAccessoryView = toolBar
    }
    
    @objc func action() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        
        
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

