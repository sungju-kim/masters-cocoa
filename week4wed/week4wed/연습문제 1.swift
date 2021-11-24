//
//  연습문제 1.swift
//  week4wed
//
//  Created by 성주 on 2021/11/24.
//

import Foundation

struct Files {

    func files(at path: String) -> Array<String> {
        return try!FileManager.default.contentsOfDirectory(atPath: path).sorted()
    }
    
    func isExist(filename: String, at path: String) -> Bool {
        return files(at: path).contains(filename) ? true : false
        
    }
    
    
    func findDoc(at path: String) -> Array<String> {
        return files(at: path).filter{$0.contains(".doc")}
    }
    
    func multiString(filename : String ,at path: String) -> [Bool]{
        return filename.components(separatedBy: ",").map{isExist(filename: $0, at: path)}
        
    }
    func printResult(_ method : String, _ path: String, _ filename: String) {
        switch method {
        case "files":
            print(files(at: path))
        case "isExist":
            if filename.contains(","){
                print(multiString(filename: filename, at: path))
            }else{
                print(isExist(filename: filename, at: path))
            }
        case "findDoc":
            print(findDoc(at: path))
        default:
            print("nil")
        }
    }
}

let files = Files()

