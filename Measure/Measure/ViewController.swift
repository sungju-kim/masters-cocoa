//
//  ViewController.swift
//  measure
//
//  Created by 성주 on 2021/11/09.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var beforeUnit = "cm"
    var afterUnit = "m"
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
        createBeforeConvertView()
        createAfterConvertView()
        dismissBeforeConvertView()
        dismissAfterConvertView()
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
        
        if pickerView == showPicker {
            showPicker.text = units[row]
        }else {
            showPicker2.text = units[row]
        }
    }

    func createBeforeConvertView () {
        let beforeConvertView = UIPickerView()
        beforeConvertView.delegate = self
        showPicker.inputView = beforeConvertView
    }
    func createAfterConvertView() {
        let afterConvertView = UIPickerView()
        afterConvertView.delegate=self
        showPicker2.inputView = afterConvertView
    }
    func dismissBeforeConvertView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        showPicker.inputAccessoryView = toolBar
    }
    func dismissAfterConvertView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(self.action2))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        showPicker2.inputAccessoryView = toolBar
    }
    
    @objc func action() {
        self.view.endEditing(true)
        beforeUnit = showPicker.text!

       }
    @objc func action2() {
        self.view.endEditing(true)
        afterUnit = showPicker.text!
       }
    
    @IBAction func convertButton(_ value: Any) {
        
        guard let nonOptionalValue = typeValue.text else {
            return
        }
        let double = Double(nonOptionalValue)
        guard let nonOptionalDouble = double else {
            return
        }

        converter(beforeConvertNum: nonOptionalDouble)
     
        
    }
    
    func converter(beforeConvertNum : Double) {
        var beforeConvert = Measurement(value: beforeConvertNum, unit: UnitLength.centimeters)
        
        switch beforeUnit{
        case "mm" :
            beforeConvert = Measurement(value: beforeConvertNum, unit: UnitLength.millimeters)
        case "cm" :
            beforeConvert = Measurement(value: beforeConvertNum, unit: UnitLength.centimeters)
        case "m" :
            beforeConvert = Measurement(value: beforeConvertNum, unit: UnitLength.meters)
        case "km" :
            beforeConvert = Measurement(value: beforeConvertNum, unit: UnitLength.kilometers)
        case "in" :
            beforeConvert = Measurement(value: beforeConvertNum, unit: UnitLength.inches)
        case "ft" :
            beforeConvert = Measurement(value: beforeConvertNum, unit: UnitLength.feet)
        case "yd" :
            beforeConvert = Measurement(value: beforeConvertNum, unit: UnitLength.yards)
        case "mi" :
            beforeConvert = Measurement(value: beforeConvertNum, unit: UnitLength.miles)
        
        default:
            return
        }
    
        var afterConvert = beforeConvert.converted(to: UnitLength.meters)
        switch afterUnit{
        case "mm" :
            afterConvert = beforeConvert.converted(to: UnitLength.millimeters)
        case "cm" :
            afterConvert = beforeConvert.converted(to: UnitLength.centimeters)
        case "m" :
            afterConvert = beforeConvert.converted(to: UnitLength.meters)
        case "km" :
            afterConvert = beforeConvert.converted(to: UnitLength.kilometers)
        case "in" :
            afterConvert = beforeConvert.converted(to: UnitLength.inches)
        case "ft" :
            afterConvert = beforeConvert.converted(to: UnitLength.feet)
        case "yd" :
            afterConvert = beforeConvert.converted(to: UnitLength.yards)
        case "mi" :
            afterConvert = beforeConvert.converted(to: UnitLength.miles)
        
        default:
            return
        }
        beforeNum.text = "\(beforeConvert)"
        textIs.text = "Is"
        showValue.text = "\(afterConvert)"
        typeValue.text = ""
    }
    
}

