//
//  ViewController.swift
//  koWatch
//
//  Created by 성주 on 2021/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var hourLabels: [UILabel]!
    
    @IBOutlet var minutesLabels: [UILabel]!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet var amPmLabel: [UILabel]!
    
    @IBOutlet weak var sunOrMoon: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.secondLabel.numberOfLines = 0
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.paintLabel), userInfo: nil, repeats: true)
    }
    
    func getTime() -> (Int, Int, Int, Bool) {
        let currentDate = Date()
        let calendar = Calendar.current
        let comp = calendar.dateComponents([.hour, .minute, .second], from: currentDate)
        guard var hour = comp.hour else {return (0,0,0,false)}
        guard let minute = comp.minute else {return (0,0,0,false)}
        guard let second = comp.second else {return (0,0,0,false)}
        let morning = hour < 12 ? true : false
        if !morning {
            hour -= 12
        }
        return (hour, minute, second, morning)
    }
    
    func moon(_ activate: Bool) {
        switch activate{
        case true :
            sunOrMoon.text = "☀️"
        case false:
            sunOrMoon.text = "🌙"
        }
    }

    @objc func paintLabel(){
        let (hour, minute, second, morning) = getTime()
        if second == 0{
            paintDefault(hour: false)
            if minute == 0 {
                paintDefault(hour: true)
                if hour == 7 {
                    moon(morning)
                }
            }
        }
        paintAmPm(morning)
        paintHour(hour)
        paintMinute(minute)
        paintSeconds(second)
    }
    
    func paintAmPm(_ morning : Bool){
        amPmLabel[0].textColor = .white
        switch morning{
        case true:
            amPmLabel[1].textColor = .white
            amPmLabel[2].textColor = .gray
        case false :
            amPmLabel[1].textColor = .gray
            amPmLabel[2].textColor = .white
        }
    }
    func paintHour(_ hour : Int) {
        switch hour/10 {
        case 1:
            hourLabels[0].textColor = .white
        default:
            hourLabels[0].textColor = .gray
        }
        switch hour%10 {
        case 1...4:
            hourLabels[hour%10].textColor = .white
        case 5...6:
            hourLabels[hour%10].textColor = .white
            hourLabels[7].textColor = .white
        case 7:
            hourLabels[8].textColor = .white
            hourLabels[9].textColor = .white
        case 8:
            hourLabels[10].textColor = .white
            hourLabels[11].textColor = .white
        case 9:
            hourLabels[12].textColor = .white
            hourLabels[13].textColor = .white
        default:
            hourLabels[14].textColor = .white
        }
        hourLabels[14].textColor = .white
    }
    func paintMinute(_ minute : Int){
        switch minute/10 {
        case 1:
            minutesLabels[4].textColor = .white
        case 2...5:
            minutesLabels[minute/10-2].textColor = .white
            minutesLabels[4].textColor = .white
        default:
            minutesLabels[4].textColor = .gray
        }
        switch minute%10 {
        case 1...9:
            minutesLabels[minute%10+4].textColor = .white
            minutesLabels[14].textColor = .white
        default:
            minutesLabels[14].textColor = .gray
        }
    }
    func paintSeconds(_ second : Int) {
        switch second {
        case 1...9:
            secondLabel.text = intToKo(second%10) + "초"
        case 10...19:
            secondLabel.text = "십\n" + intToKo(second%10) + "초"
        case 20...59:
            secondLabel.text = intToKo(second/10) + "십\n" + intToKo(second%10) + "초"
        default:
            secondLabel.text = "정각"
        }
    }
    func paintDefault(hour : Bool) {
        if hour{
            hourLabels.forEach{$0.textColor = .gray}
        }else{
            minutesLabels.forEach{$0.textColor = .gray}
        }
        
    }
    
    func intToKo(_ num: Int) -> String {
        switch num{
        case 1:
            return "일"
        case 2:
            return "이"
        case 3:
            return "삼"
        case 4:
            return "사"
        case 5:
            return "오"
        case 6:
            return "육"
        case 7:
            return "칠"
        case 8:
            return "팔"
        case 9:
            return "구"
        default:
            return ""
        }
    }
    
}

