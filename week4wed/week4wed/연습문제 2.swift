//
//  연습문제 2.swift
//  week4wed
//
//  Created by 성주 on 2021/11/24.
//

import Foundation

class CodeSquad{
    var name : String
    var email : String
    var language : String
    var grade : Int
    var dict : [String : Any]
    var squadArr : [[String:Any]]
    
    init(filename: String){
        name = ""
        email = ""
        language = ""
        grade = 0
        dict = [:]
        squadArr = []
        var convert = makeCsvToArr(cleanFile(filename: filename))
        convert.removeFirst()
        convert.forEach{add(name: $0[0], email: $0[1], language: $0[2], grade: Int($0[3])!)
        }
        
    }
    func cleanFile(filename : String) -> String{
        let contents = try!String(contentsOfFile: "\(filename)")
        let csv = contents.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\r", with: "\n").replacingOccurrences(of: "\n\n", with: "\n")
        return csv
    }
    func makeCsvToArr(_ data : String) ->[[String]] {
        var result: [[String]] = []
        let rows = data.components(separatedBy: "\n")
        for row in rows {
            let columns = row.components(separatedBy: ",")
            result.append(columns)
        }
        return result
    }
    func add(name: String, email: String, language: String, grade: Int) {
        self.dict = ["name":name, "email":email, "language":language, "grade":grade]
        squadArr.append(dict)
    }
    
    func findBy(name : String) -> [String:Any]{
        let index = squadArr.firstIndex{$0["name"] as! String == name}
        guard let index = index else {return [:]}
        return squadArr[index]
        
    }
    
    func removeBy(email: String) -> Bool {
        let index = squadArr.firstIndex{$0["email"] as! String == email}
        guard let index = index else {return false}
        squadArr.remove(at: index)
        print("removed person with \(email)")
        return true
    }
    
    func write(to file : String) -> Bool {
        
        var csvText = "name, email, language, grade\n"
        
        for dicts in squadArr {
            let newLine = "\(String(describing: dicts["name"])),\(String(describing: dicts["email"])),\(String(describing: dicts["language"])),\(String(describing: dicts["grade"]))\n"
            csvText.append(newLine as String)
        }
        let fileManager = FileManager.default
        if files.isExist(filename: file, at: "/Users/KSJ/Desktop/") {
            print("\(file) is already used")
            return false
        }else {
            do {
                let path = try fileManager.url(for: .desktopDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
                let fileURL = path.appendingPathComponent("\(file)")
                try csvText.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
                print("created \(file)")
                return true
            } catch {
                print("error creating file")
                print("\(error)")
                return false
            }
        }
    }
}





let codesquad = CodeSquad(filename: "/Users/KSJ/Desktop/swift/masters-cocoa/week4wed/example.csv")
